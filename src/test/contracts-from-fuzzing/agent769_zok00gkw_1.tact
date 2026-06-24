contract TestContract {
    field1: Int;
    field2: Bool;
    field3: Cell;
    field4: Slice;
    field5: String;

    init() {
        self.field1 = 1;
        self.field2 = true;
        self.field3 = emptyCell();
        self.field4 = emptyCell().asSlice();
        self.field5 = "hello";
    }

    receive() {
        // dummy usage
        let _ = self.field1 + 1;
    }
}