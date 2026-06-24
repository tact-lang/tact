struct Combo {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    addressVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;
    optSlice: Slice?;
}

contract ComboTest {
    c: Combo;
    init() {
        self.c = Combo{
            intVal:1, boolVal:true, stringVal:"s", addressVal:myAddress(), cellVal:emptyCell(), sliceVal:emptyCell().asSlice(),
            optInt:null, optBool:null, optAddress:null, optSlice:null
        };
    }
}