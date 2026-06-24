/* Test Snippet 4: Mutual Recursive Initialization using initOf */

contract A {
    // In its initialization, A computes the init state of B
    init() {
        let _ = initOf B();
    }
}

contract B {
    // In its initialization, B computes the init state of A
    init() {
        let _ = initOf A();
    }
}
