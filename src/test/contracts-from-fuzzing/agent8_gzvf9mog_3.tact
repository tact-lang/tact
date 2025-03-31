/// Test 3: Recursive initialization between two contracts

contract A {
    init(x: Int) {
        // Recursive call: A initializing B
        let _ = initOf B(x);
    }
}

contract B {
    init(x: Int) {
        // Recursive call: B initializing A
        let _ = initOf A(x);
    }
}

contract EntryPoint {
    init() {
        // Start the recursive chain with A initialized with 10
        let _ = initOf A(10);
    }
}
