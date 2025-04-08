struct MixedTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
}

contract TestMixedTypes {
    data: MixedTypes;
    init() {
        self.data = MixedTypes{
            a: 11,
            b: true,
            c: "text",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress()
        };
    }
}