contract LargePersistentFields {
    field1: Int;
    field2: Bool;
    field3: Address;
    field4: String;
    field5: Cell;
    field6: Slice;
    field7: Builder;
    field8: Int?;
    field9: Bool?;
    field10: Address?;
    
    init() {
        self.field1 = 0;
        self.field2 = true;
        self.field3 = myAddress();
        self.field4 = "hello";
        self.field5 = emptyCell();
        self.field6 = self.field5.asSlice();
        self.field7 = beginCell();
        self.field8 = null;
        self.field9 = null;
        self.field10 = null;
    }
}