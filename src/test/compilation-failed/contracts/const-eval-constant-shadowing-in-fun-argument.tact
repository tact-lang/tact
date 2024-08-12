const C: Int = 0;

fun shadowingFunction(C: Int): Int {
    return C;
}

contract ConstEvalNegativeTest {
    get fun something(): Int {
        return shadowingFunction(2);
    }
}
