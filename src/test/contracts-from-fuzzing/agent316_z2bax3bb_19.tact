struct MixedPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
}

contract Test {
    data: MixedPrimitives;

    init() {
        self.data = MixedPrimitives{
            a:1,
            b:true,
            c:"c",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice()
        };
    }
}
