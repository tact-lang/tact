contract A {
    init() {}
    
    // This getter compares the computed addresses of contract A and contract B
    get fun testA(): Int {
         let addrA = contractAddress(initOf A());
         let addrB = contractAddress(initOf B());
         return (addrA == addrB ? 0 : 1);
    }
}

contract B {
    init() {}
    
    // This getter does the same comparison as in A
    get fun testB(): Int {
         let addrA = contractAddress(initOf A());
         let addrB = contractAddress(initOf B());
         return (addrA == addrB ? 0 : 1);
    }
}
