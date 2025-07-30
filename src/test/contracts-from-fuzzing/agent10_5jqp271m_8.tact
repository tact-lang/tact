fun foo(a: Int,) : Int {
    return a + 1;
}

contract Test {
    receive() {
        foo(1);
    }
}