struct MixedTypes {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
}

contract Storage {
    data: MixedTypes;

    init() {
        self.data = MixedTypes{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "test",
        };
    }
}