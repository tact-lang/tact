contract B(param: Int) {
    // No explicit init() function as per contract parameters requirement
    receive() {}
}

contract TestInitParams {
    receive() {
        let s: StateInit = initOf B(42);
    }
}
