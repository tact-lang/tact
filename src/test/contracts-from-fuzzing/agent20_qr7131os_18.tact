fun add(a: Int, b: Int): Int {
    return a + b;
}

contract TestFunctionCall {
    receive() {
         dump(add(10,20));
    }
}
