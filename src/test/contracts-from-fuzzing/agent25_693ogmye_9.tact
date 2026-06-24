contract L1 {
    init() {}
    fun getL2Init() : StateInit {
         return initOf L2();
    }
}

contract L2 {
    init() {}
    fun getL3Init() : StateInit {
         return initOf L3();
    }
}

contract L3 {
    init() {}
    fun getL1Addr() : Address {
         return contractAddress(initOf L1());
    }
}

contract ComplexTest {
    fun testCycle() : Bool {
         // Compute initial states for L1, L2, and L3
         let l1Init = initOf L1();
         let l2Init = initOf L2();
         let l3Init = initOf L3();

         // Compute addresses from these initial states
         let addrL1 = contractAddress(l1Init);
         let addrL2 = contractAddress(l2Init);
         let addrL3 = contractAddress(l3Init);

         // Ensure the computed addresses are all distinct
         return (addrL1 != addrL2) && (addrL2 != addrL3) && (addrL1 != addrL3);
    }

    fun testNestedCalls() : Bool {
         // Validate that nested initOf calls yield consistent code
         let l1Init1 = initOf L1();
         let l1Init2 = initOf L1();
         return l1Init1.code == l1Init2.code;
    }

    fun combinedTest() : Bool {
         // Combine multiple tests
         return self.testCycle() && self.testNestedCalls();
    }
}
