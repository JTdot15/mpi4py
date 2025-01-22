# Import the MPI module from mpi4py
from mpi4py import MPI
import time

# Initialize the MPI communicator
comm = MPI.COMM_WORLD

# Get the rank, size, and processor name of the current process
rank = comm.rank
size = comm.size
name = MPI.Get_processor_name()

# Calculate a shared value based on the rank
shared = (rank + 1) * 5

# Check each rank
if rank == 0:
    # If rank is 0, send data to processes with ranks 1 and 2
    data = shared
    comm.send(data, dest=1)
    comm.send(data, dest=2)
    print('From rank', rank, 'we sent', data)

    # Sleep for 5 seconds to allow other processes to complete
    time.sleep(5)
elif rank == 1:
    # If rank is 1, receive data from rank 0
    data = comm.recv(source=0)
    print('On rank', rank, 'we received:', data)

elif rank == 2:
    # If rank is 2, receive data from rank 0
    data = comm.recv(source=0)
    print('On rank', rank, 'we received:', data)
