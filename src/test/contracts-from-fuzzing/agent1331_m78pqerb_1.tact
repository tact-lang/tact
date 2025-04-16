struct Nested {
    a: Int;
    b: Bool;
}

contract TestContract {
    field1: Int;
    field2: Bool;
    field3: Address;
    field4: Cell;
    field5: Slice;
    field6: String;
    field7: Int?;
    field8: Bool?;
    field9: Address?;
    field10: Cell?;
    field11: Slice?;
    field12: String?;
    field13: Nested;
    field14: Nested?;

    init() {
        self.field1 = 1;
        self.field2 = true;
        self.field3 = myAddress();
        self.field4 = emptyCell();
        self.field5 = emptyCell().asSlice();
        self.field6 = "test";
        self.field7 = 7;
        self.field8 = false;
        self.field9 = myAddress();
        self.field10 = emptyCell();
        self.field11 = emptyCell().asSlice();
        self.field12 = "optional";
        self.field13 = Nested{a: 10, b: true};
        self.field14 = Nested{a: 20, b: false};
    }
}