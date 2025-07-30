contract B(param: Int) {
}

contract Test {
    receive() {
        let s: StateInit = initOf B(42);
    }
}
