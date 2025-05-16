struct IntPair {
    left: Int;
    right: Int;
}

fun testStructOptional(i: IntPair?): IntPair? {
    return i;
}

contract TestStructOptional {
    receive() {
        let x: IntPair? = null;
        testStructOptional(x);
    }
}