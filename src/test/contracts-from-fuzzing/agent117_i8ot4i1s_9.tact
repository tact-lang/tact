contract D {
    // Contract with init function taking two parameters
    init(a: Int, b: Int) {
        // No-op initialization
    }
    receive() {}
}

contract TestMultiParams {
    receive() {
        // Valid usage: passing two parameters to initOf D
        let s = initOf D(10, 20);
        // Access some field to use s
        s.data;
        // Obtain the code cell of D
        let c = codeOf D;
        c;
    }
}
