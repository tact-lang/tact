contract C(param: Int) {
    // Using contract parameters, no init() allowed
    // Persistent state via contract parameter
    receive() {}
}

contract Test3 {
    receive() {
        let c_init = initOf C(200);
        let c_code: Cell = codeOf C;
        // Force evaluation
        c_init.data;
    }
}
