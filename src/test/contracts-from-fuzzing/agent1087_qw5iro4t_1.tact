contract TestContract {
    field1: Int;
    field2: Bool;
    field3: Address;
    
    init() {
        self.field1 = 1;
        self.field2 = true;
        self.field3 = myAddress();
    }
    
    receive() {
        // Dummy receiver to compile the contract
    }
}