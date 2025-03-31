contract A {
    init() {}
}

contract B {
    init() {}
    fun getAAddress() : Address {
         let aInit = initOf A();
         return contractAddress(aInit);
    }
}

contract AdvancedGraph {
    fun testHashes() : Bool {
         // Obtain initial states of A and B
         let aInit = initOf A();
         let bInit = initOf B();
         // Compute hashes from code and data
         let hashA = contractHash(aInit.code, aInit.data);
         let hashB = contractHash(bInit.code, bInit.data);
         return hashA != hashB;
    }

    fun nestedInitCalls() : Bool {
         // Repeated calls to initOf A() should yield equivalent code
         let aInit1 = initOf A();
         let aInit2 = initOf A();
         return aInit1.code == aInit2.code;
    }

    fun combinedTest() : Bool {
         // Calling self methods using explicit self qualifier
         return self.nestedInitCalls() && self.testHashes();
    }
}
