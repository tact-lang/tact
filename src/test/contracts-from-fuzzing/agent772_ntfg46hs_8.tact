struct MixedPrimitives {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    a: Address;
}

contract TestContract {
    mixed: MixedPrimitives;

    init() {
        self.mixed = MixedPrimitives{
            i: 123,
            b: true,
            s: "test",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            a: myAddress(),
        };
    }
}