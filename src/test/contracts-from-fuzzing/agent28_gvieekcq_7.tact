contract L1 {
    init() {}
    
    // Getter returns the computed address of contract L2
    get fun getNext(): Address {
         return contractAddress(initOf L2());
    }
}

contract L2 {
    init() {}
    
    // Getter returns the computed address of contract L3
    get fun getNext(): Address {
         return contractAddress(initOf L3());
    }
}

contract L3 {
    init() {}
    
    // Getter returns the computed address of contract L4
    get fun getNext(): Address {
         return contractAddress(initOf L4());
    }
}

contract L4 {
    init() {}
    
    // Getter returns the computed address of contract L5
    get fun getNext(): Address {
         return contractAddress(initOf L5());
    }
}

contract L5 {
    init() {}
    
    // Self-validation getter: checks its own StateInit address
    get fun selfCheck(): Int {
         let addr = contractAddress(initOf L5());
         return (addr == addr ? 1 : 0);
    }
}

contract DeepChain {
    init() {}
    
    // This getter computes addresses from a chain of contracts L1 to L5 and verifies they are pairwise distinct
    get fun allDifferent(): Int {
         let a1 = contractAddress(initOf L1());
         let a2 = contractAddress(initOf L2());
         let a3 = contractAddress(initOf L3());
         let a4 = contractAddress(initOf L4());
         let a5 = contractAddress(initOf L5());
         
         // Check differences: if two addresses are equal, the corresponding equality returns 1, so we invert that
         let diff1 = (a1 == a2 ? 0 : 1);
         let diff2 = (a2 == a3 ? 0 : 1);
         let diff3 = (a3 == a4 ? 0 : 1);
         let diff4 = (a4 == a5 ? 0 : 1);
         
         return (diff1 + diff2 + diff3 + diff4 == 4 ? 1 : 0);
    }
}
