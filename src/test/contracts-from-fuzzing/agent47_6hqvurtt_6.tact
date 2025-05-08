contract C(x: Int) {
    receive() {}
}

contract D {
    receive() {
        let cInit = initOf C(42);
    }
}
