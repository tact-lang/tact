fun add(a: Int, b: Int): Int {
    return a + b;
}

contract Test {
    receive() {
         dump(add(10, 32)); // expected output: 42
    }
}
