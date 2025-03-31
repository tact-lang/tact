contract Simple {
    init() {}
    receive() {
        let addr1 = myAddress();
        let addr2 = contractAddress(initOf Simple());
        require(addr1 == addr2, "error");
    }
}
