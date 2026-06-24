contract C {
    init() {}
}

contract B {
    receive("call") {
         let initC = initOf C();
         let addrC = contractAddress(initC);
         return;
    }
}

contract A {
    receive("test") {
         let initB = initOf B();
         let addrB = contractAddress(initB);
         return;
    }
}
