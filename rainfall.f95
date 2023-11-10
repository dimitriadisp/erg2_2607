program rainfall
implicit none
    
    ! Variable Decleration
    integer,parameter::nmax=50
    integer::i,linesum=0 !Counter
    integer::st=0 ! Bohthitikh metablhth
    character(15)::town(nmax) !Two one-dimensional arrays for the rainfall and the town
    integer::rain(nmax)
    open(10,file='data.txt',status='old',iostat=st)

    ! Checking if the file opened correctly
    if(st/= 0) then 
    print'(A)', "Error opening file :("
    print*
    print'(A)',"Press Return to terminate program"
    read*
    stop
    end if

    ! Title
    print'(A)','----------------------------------------------'
    print'(A)','Average Greek Town Yearly Rainfall Data Reader'
    print'(A)','----------------------------------------------'

    ! Data Read and Display

    call read_file(nmax,town,rain,linesum)
    
    do i=1,linesum
      print'(A15,I3)',town(i),rain(i)    
    end do 




    close(10)

    ! Program Termination
    print'(A)'
    print'(A)',"Press Return to close program"  
    read*
    
contains

    subroutine read_file(nm,T,R,ln)
    integer,intent(in)::nm
    integer::st=0,i=1,ln
    integer::R(nm)
    character(15)::T(nm)

    read(10,'(A15,A)')

    do
      read(10,'(A15,I3)',iostat=st)T(i),R(i)
      if(st==-1) exit
      i=i+1
    end do
    ln=i-1
    end subroutine read_file
    
end program