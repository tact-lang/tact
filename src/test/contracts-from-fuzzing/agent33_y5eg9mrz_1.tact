contract A {
    receive() {}
}

contract Test {
    receive() {
        // Valid usage of initOf: returns StateInit structure
        let si = initOf A();
    }
}
