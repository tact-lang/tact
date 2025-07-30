struct NestedMany {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Cell?;
    opt5: Slice?;
    opt6: Builder?;
    opt7: Address?;
}

contract StructWithManyFields {
    data: NestedMany;

    init() {
        self.data = NestedMany{
            a:1,
            b:true,
            c:"hi",
            d:emptyCell(),
            e:emptyCell().asSlice(),
            f:beginCell(),
            g:myAddress(),
            opt1:null,
            opt2:null,
            opt3:null,
            opt4:null,
            opt5:null,
            opt6:null,
            opt7:null
        };
    }
}