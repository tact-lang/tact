contract Root {
    receive() {
        // Multiple independent cross-contract initializations
        let aState = initOf A();
        let bState = initOf B(10,); // Contract B with parameter and trailing comma
        let cState = initOf C();
    }
}

contract A {
    init() {}
    receive() {
        // Conditional initialization
        if (1 == 1) {
            let dState = initOf D();
        } else {
            // Use direct initialization in alternative branch
            let x = 0;
        }
    }
}

contract B {
    init(x: Int) {
        // Using parameter x
    }
    receive() {
        // Basic receive
    }
}

contract C {
    init() {}
    receive() {
        // Cross-contract cyclic dependency: calling initOf A
        let aState = initOf A();
    }
}

contract D {
    init() {}
    receive() {
        // Basic receive
    }
}
