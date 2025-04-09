contract Example {
    init() {}
    receive() {}
}

contract Test {
    receive() {
        let s = initOf Example();
    }
}
