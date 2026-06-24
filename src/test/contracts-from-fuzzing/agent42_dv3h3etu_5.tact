contract TestMyAddress {
    receive() {
        let addr1: Address = myAddress();
        let s: StateInit = initOf TestMyAddress();
        let addr2: Address = contractAddress(s);
        require(addr1 == addr2, "Mismatch between myAddress and computed contractAddress");
    }
}
