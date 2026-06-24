fun test(_: Int): Int {
    return 123;
}

contract Test {
    receive() {
        let a = test(42);
        dump(a);
    }
}
