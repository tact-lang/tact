struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Address;
    f6: Cell;
    f7: Bool?;
    f8: Slice;
    f9: String?;
    f10: Int;
}

contract ComplexManyFields {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1:1,f2:true,f3:"ab",f4:null,f5:myAddress(),
            f6:emptyCell(),f7:null,f8:emptyCell().asSlice(),
            f9:null,f10:10
        };
    }
}