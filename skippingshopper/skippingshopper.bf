Header structure
-       255: beginnning marker (MK1)
>+++++  5: number of iterations remaining (ITER)
>>>     0 0 0: working memory (W1 thru W3)
>>      0 0: min starting at 1
>>      0 0: min starting at 2
>>      0 0: min starting at 3
>>      0 0: min starting at 4
>>      0 0: min starting at 5
>>>     0 0 0: working memory; block 2 (X1 thru X3)
>-      255: end of header & beginning of data marker (MK2)


Hardcode working data for now
6 {} 5 {} 4 {} 3 {} 2 {} 1 {} 3 {} 3 {} 3 {} 3 {} 3; where each {} is four empty cells

Each set of empty cells:
    1: stores the cell number
    2: stores the current minimum's value
    3: working memory (used to jump pointer forwards)
    4: stores the current minimum's position
    if we need more working memory we can just shift the next cell over lol

Notation: D(n) represents the nth data cell
          D(n)^^ represents the kth corresponding helper cell for the nth data cell; where k is the number of carats
          Note that n ^ k represents the sum of n and k because the plus symbol is unavailable

>   ++++++  > +             >>> value of 6 in D(1)
>   +++++   > ++            >>> value of 5 in D(2)
>   ++++    > +++           >>> and so on
>   +++     > ++++          >>>
>   ++      > +++++         >>>
>   +       > ++++++        >>>
>   +++     > +++++++       >>>
>   +++     > ++++++++      >>>
>   +++     > +++++++++     >>>
>   +++     > ++++++++++    >>>
>   +++     > +++++++++++

move ptr to ITER
    +[-<+]- back to MK2
    < so that it doesn't just stay at MK2
    +[-<+]- back to MK1
    > forward to ITER


Main loop for the program (hopefully? should've planned out more; but idc lmao)
!|[ starts on ITER
    copy ITER to W1; end ptr on W1
        [>+>+<<-] destructively move ITER to W1 and W2
        >> point to W2
        [-<<+>>] destructively move W2 to ITER
        < end on W1

    NEXT LINES DEPENDS ON HEADER SIZE; BE CAREFUL WHEN UPDATING THE HEADER
    [- >>>>>>>>>>>>>>> + <<<<<<<<<<<<<<<] move W1 to X3
       >>>>>>>>>>>>>>> send ptr to X3

    Now that we have the value of ITER in X3; we can destroy it from X1 to send the pointer to the right starting position
    [
        [->>>>>+<<<<<] move value to next D^^^ cell
        >>>>> move pointer to next D^^^ cell
        - count number of repetitions
    ]

    < jump to D(n)
    !
    We will iterate through the elements until we see a zero; meaning that there's no data left
    [
        
    ]

    (todo: finish the main body of the loop)


    (todo: at the end of the loop; we have to go back to the iteration counter)

    - Decrement the number of iterations remaining
!]|

