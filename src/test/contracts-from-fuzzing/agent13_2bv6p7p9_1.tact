contract A {
    init() {}
}

contract B {
    // Getter function obtains the initial state of A and computes its address
    get fun getAAddress(): Address {
        let initA = initOf A();
        return contractAddress(initA);
    }
}
