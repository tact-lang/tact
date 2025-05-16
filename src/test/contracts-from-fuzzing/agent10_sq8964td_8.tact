/* Test 8: Valid use of 'as remaining' as the last field */

struct ValidRemaining {
    a: Cell;
    b: Cell as remaining;
}

fun test() {
    let v = ValidRemaining { a: emptyCell(), b: emptyCell() };
}
