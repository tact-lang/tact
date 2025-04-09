contract C(x: Int, y: Int) {}

contract TestCValid {
    receive() {
        // Valid usage: providing both parameters
        let s: StateInit = initOf C(10, 20);
    }
}
