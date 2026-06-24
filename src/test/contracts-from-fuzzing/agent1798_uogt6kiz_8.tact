struct ManyFields {
    x1: Int;
    x2: Bool;
    x3: String;
    x4: Address;
    x5: Cell;
    x6: Builder;
    x7: Slice;
    x8: Int?;
    x9: String?;
    x10: Address?;
}

contract ManyStructFields {
    val: ManyFields;

    init() {
        self.val = ManyFields{
            x1:1, x2:true, x3:"hi", x4:myAddress(), x5:emptyCell(),
            x6:beginCell(), x7:emptyCell().asSlice(), x8:null, x9:null, x10:null
        };
    }
}