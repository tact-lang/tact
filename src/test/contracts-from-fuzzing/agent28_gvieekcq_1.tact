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

// The contract can be deployed and selfCheck() called to confirm that the initOf expression produces a valid StateInit with a matching address.