contract TestContractAddress {
    // Test that the runtime address of the current contract (myAddress()) equals the address computed from its StateInit using contractAddress()
    fun test(): Bool {
        let addr1 = myAddress();
        let addr2 = contractAddress(initOf TestContractAddress());
        return addr1 == addr2;
    }

    // Minimal receive function
    receive() {}
}
