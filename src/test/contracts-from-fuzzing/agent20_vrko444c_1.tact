contract B {
    init() {
        // no state
    }
}

contract A {
    receive() {
        let s: StateInit = initOf B();
    }
}
