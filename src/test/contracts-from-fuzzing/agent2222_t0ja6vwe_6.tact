struct NestedArrays {
    f1: Int;
    f2: String;
    f3: Bool;
    f4: Address;
    f5: Slice;
    f6: Cell;
    f7: Int?;
    f8: Bool?;
    f9: String?;
    f10: Address?;
}

contract TestContract {
    data: NestedArrays;

    init() {
        self.data = NestedArrays{
            f1:1, f2:"hi", f3:true, f4:myAddress(), f5:emptyCell().asSlice(),
            f6:emptyCell(), f7:null, f8:null, f9:null, f10:null
        };
    }
}