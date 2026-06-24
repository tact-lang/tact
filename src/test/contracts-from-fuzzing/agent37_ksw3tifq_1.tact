contract Child {
    // Empty contract, no init required
}

contract Parent {
    init() {
        // Test simple cross-contract initialization using initOf
        let child_pkg = initOf Child();
    }
}
