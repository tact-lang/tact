contract MultipleFields {
    field1: Bool;
    field2: Int;
    field3: Bool;
    field4: String;
    field5: Cell;
    field6: Address;
    field7: Int;
    field8: Bool;
    field9: Int;

    init() {
        self.field1 = true;
        self.field2 = 2;
        self.field3 = false;
        self.field4 = "test";
        self.field5 = emptyCell();
        self.field6 = myAddress();
        self.field7 = 7;
        self.field8 = true;
        self.field9 = 9;
    }
}