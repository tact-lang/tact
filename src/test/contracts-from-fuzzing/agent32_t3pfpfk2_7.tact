contract E {
    init() {}
    receive() {}
}

contract D {
    init(x: Int) {
        // Initialize E from within D, ignoring x
        let s: StateInit = initOf E();
    }
    receive() {}
}

contract C {
    init(x: Int) {
        // Initialize D with modified parameter
        let s: StateInit = initOf D(x - 1);
    }
    receive() {}
}

contract B {
    init(x: Int) {
        // Initialize C with modified parameter
        let s: StateInit = initOf C(x * 2);
    }
    receive() {}
}

contract A {
    init(x: Int) {
        // Initialize B with modified parameter
        let s: StateInit = initOf B(x + 10);
    }
    receive() {}
}
