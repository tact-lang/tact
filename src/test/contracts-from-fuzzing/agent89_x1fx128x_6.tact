contract C() {
    receive() {}
}

contract TestEmpty {
    receive() {
        let pkg = initOf C();
        let code = codeOf C;
    }
}
