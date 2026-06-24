contract C(x: Int) {
    receive() {}
}

contract Tester5 {
    receive() {
        let s = initOf C(42);
        let c = codeOf C;
    }
}
