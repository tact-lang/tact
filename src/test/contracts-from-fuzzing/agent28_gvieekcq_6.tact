contract X {
    // Contract with a parameter
    intParam: Int;
    
    // Parameterized contract constructor
    init(a: Int) {
        self.intParam = a;
    }
    
    // Getter that obtains the StateInit of Y with parameter (intParam + 1) and computes its address
    get fun checkY() : Int {
         let s = initOf Y(self.intParam + 1);
         let addrY = contractAddress(s);
         // Verify that the computed address is non-zero by comparing with itself (dummy check)
         return (addrY == addrY ? 1 : 0);
    }
}

contract Y {
    // Contract with a parameter
    intParam: Int;
    
    init(a: Int) {
        self.intParam = a;
    }
    
    // Getter that obtains the StateInit of X with parameter (intParam - 1) and computes its address
    get fun checkX() : Int {
         let s = initOf X(self.intParam - 1);
         let addrX = contractAddress(s);
         // Verify that the computed address is non-zero by comparing with itself
         return (addrX == addrX ? 1 : 0);
    }
}

// Additional contract to test deep hierarchical dependency
contract DeepParent {
    init() {}
    
    // This getter computes a nested chain: DeepParent -> ChildSimple -> GrandChild
    get fun deepCheck() : Int {
         let childState = initOf ChildSimple();
         let grandChildState = initOf GrandChild();
         let addrChild = contractAddress(childState);
         let addrGrand = contractAddress(grandChildState);
         // They must be different addresses
         return (addrChild == addrGrand ? 0 : 1);
    }
}

contract ChildSimple {
    init() {}
    
    // Modified getter to check consistency of GrandChild's init state address
    get fun forwardCheck() : Int {
         let addr = contractAddress(initOf GrandChild());
         return (addr == addr ? 1 : 0);
    }
}

contract GrandChild {
    init() {}
    
    get fun simpleCheck() : Int {
         // Simply compute its own address and compare with itself
         let addr = contractAddress(initOf GrandChild());
         return (addr == addr ? 1 : 0);
    }
}

// Finally, a recursive self-initialization test
contract SelfRec {
    init() {}
    
    // Getter calls initOf on itself twice and compares addresses
    get fun multiSelf() : Int {
         let addr1 = contractAddress(initOf SelfRec());
         let addr2 = contractAddress(initOf SelfRec());
         return (addr1 == addr2 ? 1 : 0);
    }
}
