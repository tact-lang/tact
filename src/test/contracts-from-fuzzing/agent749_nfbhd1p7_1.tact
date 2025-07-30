contract TestContract {
    field1: Int;
    field2: Bool;
    field3: Address;

    init() {
        self.field1 = 0;
        self.field2 = false;
        self.field3 = myAddress();
    }

    receive() {
        // Reference fields to ensure persistence
        let _ = self.field1;
        let _ = self.field2;
        let _ = self.field3;
    }
}