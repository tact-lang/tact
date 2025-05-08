fun myAdd(a: Int, b: Int): Int {
    return a + b;
}

contract TestFunctionCallChaining {
    receive() {
        let sum1: Int = myAdd(10, 15);
        let sum2: Int = myAdd(1 + 2, 3 * 4);
        dump(sum1);
        dump(sum2);
    }
}
