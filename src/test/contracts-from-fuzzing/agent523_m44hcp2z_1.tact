struct Nested1 { a: Int }

contract TestContract {
    field1: Bool;
    field2: Int;
    field3: Address;
    field4: Cell;
    field5: Builder;
    field6: Slice;
    field7: String;
    field8: Int?;
    field9: Bool?;
    field10: Address?;
    field11: Cell?;
    field12: Slice?;
    field13: String?;
    field14: Nested1;
    field15: Nested1?;

    init() {
        self.field1 = true;
        self.field2 = 1;
        self.field3 = myAddress();
        self.field4 = emptyCell();
        self.field5 = beginCell();
        self.field6 = emptyCell().asSlice();
        self.field7 = "";
        self.field8 = 1;
        self.field9 = true;
        self.field10 = myAddress();
        self.field11 = emptyCell();
        self.field12 = emptyCell().asSlice();
        self.field13 = "";
        self.field14 = Nested1{ a: 1 };
        self.field15 = Nested1{ a: 1 };
    }
}
