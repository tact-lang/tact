////////// Test 10: Using initOf in contract to compute its own address
contract SelfAddr {
    init() {}
    receive() {
        let addr1 = myAddress();
        let addr2 = contractAddress(initOf SelfAddr());
        // Compare addresses; expected to be true at runtime
        let eq = (addr1 == addr2);
    }
}
