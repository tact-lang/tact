struct LargeStruct {
    field1: Int;
    field2: Bool;
    field3: String;
    field4: Cell;
    field5: Slice;
    field6: Bool?;
    field7: Int?;
    field8: Slice?;
    field9: String?;
    field10: Cell?;
    field11: Address;
    field12: Address?;
    field13: Int;
    field14: Bool;
    field15: String;
    field16: Cell;
    field17: Slice;
    field18: Bool?;
    field19: Int?;
    field20: Address?;
}

contract TestContract {
    storage: LargeStruct;

    init() {
        self.storage = LargeStruct{
            field1:1, field2:true, field3:"a", field4:emptyCell(), field5:emptyCell().asSlice(),
            field6:true, field7:7, field8:emptyCell().asSlice(), field9:"b", field10:emptyCell(),
            field11:myAddress(), field12:myAddress(), field13:13, field14:false, field15:"c", 
            field16:emptyCell(), field17:emptyCell().asSlice(), field18:false, field19:19, field20:myAddress()
        };
    }

    receive() {
        self.storage = self.storage;
    }
}