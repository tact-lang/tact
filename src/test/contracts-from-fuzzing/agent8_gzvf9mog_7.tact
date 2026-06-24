/// Test 7: Triple cyclic dependency among contracts

contract A {
    init(x: Int) {
        // A initializes B with parameter increased by 1
        let _ = initOf B(x + 1);
    }
}

contract B {
    init(x: Int) {
        // B initializes C with parameter increased by 1
        let _ = initOf C(x + 1);
    }
}

contract C {
    init(x: Int) {
        // C initializes A with parameter increased by 1, closing the cycle
        let _ = initOf A(x + 1);
    }
}

contract Entry {
    init() {
        // Kickstart the cyclic chain by initializing A
        let _ = initOf A(1);
    }
}
