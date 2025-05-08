fun foo(a: Int, b: Int): Int {
    return a + b;
}

contract C {
    receive() {
        foo(1,2,);
    }
}