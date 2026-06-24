contract D {
    init() {}
}

contract C {
    init() {}
}

contract B {
    init() {
         let dInit = initOf D();
         let cInit = initOf C();
    }
}

contract A {
    init() {
         let bInit = initOf B();
         let cInit = initOf C();
    }
    
    // Getter to verify self-consistency of initOf and contractAddress
    get fun checkGraph(): Int {
         let initA1 = initOf A();
         let addr1 = contractAddress(initA1);
         let initA2 = initOf A();
         let addr2 = contractAddress(initA2);
         if (addr1 == addr2) { return 1; } else { return 0; }
    }
}
