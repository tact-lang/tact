struct LotsOfFields {
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
    b1: Bool;
    b2: Bool;
    s1: String;
    s2: String;
    c1: Cell;
    c2: Cell;
    sl1: Slice;
    sl2: Slice;
    a1: Address;
    a2: Address;
}

contract LargeStructPersistent {
    state: LotsOfFields;
    init() {
        self.state = LotsOfFields{
            i1:1,i2:2,i3:3,i4:4,
            b1:true,b2:false,
            s1:"hello",s2:"world",
            c1:emptyCell(),c2:emptyCell(),
            sl1:beginCell().endCell().asSlice(),
            sl2:beginCell().endCell().asSlice(),
            a1:myAddress(),a2:myAddress()
        };
    }
}
