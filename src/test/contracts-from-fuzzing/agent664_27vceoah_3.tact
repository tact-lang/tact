struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String?;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: Builder;
    f8: Int?;
    f9: Bool?;
    f10: String;
}

contract ManyFieldsTest {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1:1, f2:true, f3:null, f4:myAddress(), f5:emptyCell(),
            f6:emptyCell().asSlice(), f7:beginCell(), f8:null, f9:null, f10:"hi"
        };
    }
}
