/* Test 8: CorrectRemaining - Valid usage of 'as remaining' on last field */

struct CorrectRemaining {
    value: Int;
    rest: Slice as remaining;
}

fun myEmptySlice() : Slice {
    return (beginCell().endCell()).asSlice();
}

fun main() {
    let s = CorrectRemaining{ value: 10, rest: myEmptySlice() };
}
