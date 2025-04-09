contract TestContract {
    field1: Int;
    field2: Bool;
    field3: String;
    field4: Address;

    init() {
        self.field1 = 1;
        self.field2 = true;
        self.field3 = "hello";
        self.field4 = myAddress();
    }

    receive() {}
}