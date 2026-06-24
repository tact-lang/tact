fun increment(x: Int): Int {
    return x + 1;
}

contract TestFunctionCallChaining {
    receive() {
        let a: Int = increment(5);
        let s: String = a.toString();
    }
}
