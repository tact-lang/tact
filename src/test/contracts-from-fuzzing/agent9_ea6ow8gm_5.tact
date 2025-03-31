/* Snippet 5: Three-level Hierarchical Contract Initialization (A -> B -> C -> D) */

contract D {
    init() {}
}

contract C {
    init() {
        // Initialize contract D inside C
        let d_pack: StateInit = initOf D();
    }
}

contract B {
    init() {
        // Initialize contract C inside B
        let c_pack: StateInit = initOf C();
    }
}

contract A {
    init() {
        // Initialize contract B inside A
        let b_pack: StateInit = initOf B();
    }
    
    fun checkChain() : Bool {
        // Additionally, in a function, re-obtain the init state of D
        let d_pack: StateInit = initOf D();
        return true;
    }
}
