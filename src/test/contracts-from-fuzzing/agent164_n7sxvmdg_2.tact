contract Test {
    flag: Int = 0;
    
    // specific text comment receiver
    receive("hello") {
        self.flag = 100;
    }
    
    // necessary receiver for contract to be complete
    receive() {}
}
