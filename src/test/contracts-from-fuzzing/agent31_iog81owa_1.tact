contract B {
    init() {}
}

contract A {
    receive("test") {
         let initB = initOf B();
         let addrB = contractAddress(initB);
         // simple cross-contract initialization test
         return;
    }
}
