contract Leaf {
    init() {}
}

contract Middle {
    // state variable to store the Leaf contract's address
    leafAddr: Address;
    
    init() {
        let initLeaf = initOf Leaf();
        self.leafAddr = contractAddress(initLeaf);
    }

    get fun getLeafAddr(): Address {
        return self.leafAddr;
    }
}

contract Root {
    // state variable to store the Middle contract's address
    middleAddr: Address;

    init() {
        let initMiddle = initOf Middle();
        self.middleAddr = contractAddress(initMiddle);
    }

    get fun getMiddleAddr(): Address {
        return self.middleAddr;
    }
}
