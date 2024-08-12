const C: Int = 0;

fun shadowingFunction(): Int {
    let C: Int = 3;
    return C;
}

contract ConstEvalNegativeTest {
    get fun something(): Int {
        return shadowingFunction();
    }
}
