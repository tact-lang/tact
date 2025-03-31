fun foo(_: Int): Int {
    return 1;
}

contract Test {
    receive() {
        // Valid usage as discard in function parameter
        let _ = foo(123);
    }
}
