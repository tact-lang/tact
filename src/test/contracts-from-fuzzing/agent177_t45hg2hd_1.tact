contract TestContract {
    intField: Int = 1;
    boolField: Bool = true;
    stringField: String = "hello";
    addressField: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");

    init() {
        self.intField = 42;
        self.boolField = false;
        self.stringField = "world";
        self.addressField = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    }
    
    receive() {}
}