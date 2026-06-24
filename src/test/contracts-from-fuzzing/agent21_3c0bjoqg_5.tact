struct MixedSerialization {
    a: Int as uint32;
    b: Bool;
    c: String;
    d: Int as int64;
    e: Address;
    f: Slice;
    g: Cell;
}

contract TestContract {
    mixed: MixedSerialization;

    init() {
        self.mixed = MixedSerialization{
            a: 100,
            b: true,
            c: "hello",
            d: -50,
            e: myAddress(),
            f: emptyCell().asSlice(),
            g: emptyCell()
        };
    }
}