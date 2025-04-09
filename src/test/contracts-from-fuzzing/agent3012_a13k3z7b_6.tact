contract DefaultsMixed {
    field1: Int = 5;
    field2: Bool;
    field3: String = "abc";
    field4: Address;

    init() {
        self.field2 = true;
        self.field4 = myAddress();
    }
}