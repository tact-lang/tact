const DIV_RESULT: Int = -3 / 2; // Expected to be -2, since division rounds toward -∞

contract MapTest() {
    fun testMap(): Bool {
         let m: map<Int, Int> = emptyMap();
         m.set(1, 100);
         m.del(1);
         return m == emptyMap();
    }
    
    // Getter exposing the map test result
    get fun result(): Bool {
         return self.testMap();
    }
}

contract AddressTest() {
   // Getter that computes the contract's address based on its initial state
   get fun addr(): Address {
       let s: StateInit = initOf AddressTest();
       return contractAddress(s);
   }
}

contract Dummy() {
    // Getter exposing the DIV_RESULT constant
    get fun divResult(): Int {
        return DIV_RESULT;
    }
    
    receive() {
        // Simply forward any incoming message back
        cashback(sender());
    }
}
