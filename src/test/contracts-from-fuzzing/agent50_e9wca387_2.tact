fun foo(_ : Int): Int {
    return 42;
}

contract Test {
    receive() {
        let x = foo(10);
        dump(x);
    }
}
