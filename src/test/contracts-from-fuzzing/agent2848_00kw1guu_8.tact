struct MultiType {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
}

contract MultiTypeField {
    x: MultiType;

    init() {
        self.x = MultiType{
            a:1,
            b:true,
            c:"hi",
            d:emptyCell(),
            e:emptyCell().asSlice(),
            f:myAddress()
        };
    }
}