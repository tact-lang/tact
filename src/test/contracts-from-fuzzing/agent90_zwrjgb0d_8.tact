contract SelfCode {
    receive() {
        let eq = myCode() == codeOf SelfCode;
    }
}

contract WithExplicitInit {
    init(a: Int) {
        // init function using parameter
    }
    receive() {}
}

contract UseExplicitInitOf {
    receive() {
        // Correct parameter passing
        let s = initOf WithExplicitInit(5);
        // Using codeOf
        let c = codeOf WithExplicitInit;
    }
}

// Test mismatch in parameters: Too many arguments
contract ParamMismatch {
    init(a: Int) {
        // init function using parameter
    }
    receive() {}
}

contract UseMismatch {
    receive() {
        // Uncommenting the next line should fail with wrong number of arguments
        // let s = initOf ParamMismatch(5, 10);
    }
}
