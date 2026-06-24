contract A {
    init() {
        // Cyclic dependency: A calls initOf B
        let b_init = initOf B();
        let addrB = contractAddress(b_init);
    }
}

contract B {
    init() {
        // Cyclic dependency: B calls initOf A
        let a_init = initOf A();
        let addrA = contractAddress(a_init);
    }
}
