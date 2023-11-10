program rainfall
implicit none
    
    ! Variable Decleration
    integer::i !Counter
    integer::st=0 ! Bohthitikh metablhth
    character(15)::town(50) !Two one-dimensional arrays for the rainfall and the town
    integer::rain(50)
    character(50)::title1,title2
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
    read(10,'(A15,A50)')title1,title2
    print'(A15,A)',title1,title2

    
    do
      i=1
      read(10,'(A15,I3)',iostat=st)town(i),rain(i)
      if(st==-1) exit
      print'(A15,I3)',town(i),rain(i)
      i=i+1
        
    end do 



    close(10)

  ! Program Termination
  print'(A)'
  print'(A)',"Press Return to close program"  
  read*
  
end program