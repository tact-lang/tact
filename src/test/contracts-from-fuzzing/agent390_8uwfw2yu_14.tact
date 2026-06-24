struct MultiType {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Bool?;
    h: String;
}

contract MultiTypeFields {
    mt: MultiType;

    init() {
        self.mt = MultiType{
            a: 1, b: true, c:"ok", d:myAddress(), e:emptyCell(), f:emptyCell().asSlice(), g:null, h:"str"
        };
    }
}
