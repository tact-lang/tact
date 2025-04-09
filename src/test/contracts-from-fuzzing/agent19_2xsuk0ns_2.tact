/* Test 2: Multi-level hierarchical initialization (A -> B -> C) */

contract C {
    init() {}
    get fun getValC(): Int { 
        return 7;
    }
}

contract B {
    init() {}
    get fun getValB(): Int {
        // Nested initialization of C
        let stateC: StateInit = initOf C();
        return 8;
    }
}

contract A {
    get fun test(): Int {
        // Initialize B and indirectly C
        let stateB: StateInit = initOf B();
        return 42;
    }
}
