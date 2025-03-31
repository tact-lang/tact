fun test(_: Int): Int {
    // The parameter is discarded
    return 123;
}

contract TestContract {
    receive() {
        let result: Int = test(42);
        dump(result);
    }
}
