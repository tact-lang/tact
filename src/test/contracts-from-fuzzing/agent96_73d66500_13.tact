contract B(param: Int) {
    // Contract with parameter, no init declared
    receive() {}
}

contract TestB {
    receive() {
        let s: StateInit = initOf B(42);
    }
}
