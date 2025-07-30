contract A {
    init() {}
    // Recursive cross-contract initialization: A getting B's init package
    get fun getBAddr(): Address {
         let initB = initOf B();
         return contractAddress(initB);
    }
}

contract B {
    init() {}
    // Recursive cross-contract initialization: B getting A's init package
    get fun getAAddr(): Address {
         let initA = initOf A();
         return contractAddress(initA);
    }
}
