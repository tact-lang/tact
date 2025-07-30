contract Simple {
    init() {}
    
    // Getter that compares its own computed init state address with its runtime address
    get fun selfCheck(): Int {
         let s = initOf Simple();
         let addr1 = contractAddress(s);
         let addr2 = myAddress();
         return addr1 == addr2 ? 1 : 0;
    }
}

contract GrandChild {
    init() {}
}

contract Child {
    init() {}
    
    // This getter uses initOf to obtain the StateInit of GrandChild and then computes its address
    // Rather than comparing with an Int, we compare the address with itself to ensure proper type usage
    get fun checkGrandChild() : Int {
         let s = initOf GrandChild();
         let addr = contractAddress(s);
         return addr == addr ? 1 : 0;
    }
}

contract Parent {
    init() {}
    
    // This getter performs a multi-level check:
    // It obtains the StateInit of Child and of Parent (self), computes their addresses, and compares them.
    get fun checkChildren() : Int {
         let s1 = initOf Child();       // Initial state of Child
         let s2 = initOf Parent();        // Initial state of Parent (recursive initOf on self)
         let a1 = contractAddress(s1);
         let a2 = contractAddress(s2);
         // Check: The address computed from self's init state should match myAddress()
         let selfOk = (a2 == myAddress()) ? 1 : 0;
         // Check: The address of Child should be different from Parent's address
         let diff = (a1 == a2 ? 0 : 1);
         return selfOk + diff; // Returns 2 if both checks pass, otherwise lower
    }
}

contract Complex {
    init() {}
    
    // This getter compares addresses of two different contracts obtained via initOf
    get fun check() : Int {
         let a = contractAddress(initOf Child());
         let b = contractAddress(initOf GrandChild());
         return (a == b ? 0 : 1);
    }
}
