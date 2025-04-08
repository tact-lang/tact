contract TestContract {
    field1: Int as int64 = -100;
    field2: Int as uint64 = 100;
    field3: Int as int256 = -123456789;
    field4: Int as uint256 = 987654321;

    init() {
        self.field1 = 0;
        self.field2 = 1;
        self.field3 = 2;
        self.field4 = 3;
    }

    receive() {
        let _ = self.field4;
    }
}