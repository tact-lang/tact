contract TestContract {
    field1: Int?;
    field2: Bool?;
    field3: Address?;

    init() {
        self.field1 = 1;
        self.field2 = true;
        self.field3 = myAddress();
    }

    receive() {
        let _ = self.field1;
        let _ = self.field2;
        let _ = self.field3;
    }
}