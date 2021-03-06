program Pi
  real(8) :: pi_
  pi_ = calculate_pi(9)
  print "(A, F10.8)", "Pi = ", pi_

contains
  function calculate_pi(precision)
    real(8) :: calculate_pi, pi_, k
    integer :: precision, i, max
    pi_ = 0
    k = 1
    max = 10 ** precision
    do i = 0, max
      if (mod(i, 2) == 0) then
        pi_ = pi_ + 4 / k
      else
        pi_ = pi_ - 4 / k
      end if
      k = k + 2
    end do
    calculate_pi = pi_
  end function calculate_pi
end program Pi