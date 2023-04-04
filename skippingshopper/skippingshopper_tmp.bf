    copy D(n) to D(n)^ and D(n)^^:
        [->+>+>+<<<] destructively move D(n) to D(n)^ and D(n)^^ and D(n)^^^; ptr ends on D(n)
        >>> go to D(n)^^^
        [-<<<+>>>] destructively move D(n)^^^ to D(n); ptr ends on D(n)^^^
    < we need the ptr on D(n)^^ so that we can move forward the correct amount: D( n ^ *D(n) ) * 4

    Consume the copy at D(n)^^ to copy the previous min forwards to the inner loop:
    [
        [->>>>>+<<<<<] move D(n)^^ to D(n ^ 1)^^
        <[->>>>>+<<<<<]> move D(n)^ to D(n ^ 1)^; end ptr at D(n)^^
        >>>>> ptr to D(n ^ 1)^^
        - decrement number of jumps remaining
    ]
