/* Test 5: Circular dependency using initOf in contracts A and B (recursive cross-contract initialization) */

contract B {
    init() {
        // B's initialization references A
        let sA = initOf A();
    }

    receive() {
        // empty receive implementation
    }
}

contract A {
    init() {
        // A's initialization references B
        let sB = initOf B();
    }

    receive() {
        // empty receive implementation
    }
}
