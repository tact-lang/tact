contract TestNewAddressValid {
    fun test_valid(): Address {
       return newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    }
}

contract TestNewAddressMasterchain {
    fun test_master(): Address {
       return newAddress(-1, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    }
}

contract TestContractAddress {
    receive() {
        let s: StateInit = initOf TestContractAddress();
        let addr1: Address = contractAddress(s);
        let addr2: Address = contractAddressExt(0, s.code, s.data);
        require(addr1 == addr2, "Address mismatch");
    }
}
