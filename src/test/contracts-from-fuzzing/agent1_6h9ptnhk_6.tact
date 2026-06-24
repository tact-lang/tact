contract ContractC {
    get fun getValueC() : Int {
        return 100;
    }

    receive() {
        // Ensure ContractC is fully compiled
        let dummy = self.getValueC();
    }
}

contract ContractB(addrC: Address) {
    // Persistent state variable from parameter: addrC of type Address

    receive() {
        // Reference the address of ContractC
        let c_addr: Address = self.addrC;
        // No cross-contract call is made, simply a dependency chain
    }
}

contract ContractA(addrB: Address) {
    // Persistent state variable from parameter: addrB of type Address

    receive() {
        // Reference the address of ContractB
        let b_addr: Address = self.addrB;
        // The contract has a deep dependency chain: A -> B -> C
    }
}
