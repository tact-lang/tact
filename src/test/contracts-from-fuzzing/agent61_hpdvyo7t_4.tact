fun test() {
    // Intentionally malformed: using invalid operator sequence '+++'.
    let x: Int = 5 +++ 3;
}

contract TestContract {
    receive() {
        test();
    }
}
