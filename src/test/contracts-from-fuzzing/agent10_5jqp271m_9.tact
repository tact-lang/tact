fun foo(a: Int, b: Int,) : Int {
    return a + b;
}

contract Test {
    receive() {
        foo(1,2);
    }
}