struct MixedPrimitives {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
}

contract MixedStorage {
    data: MixedPrimitives;

    init() {
        self.data = MixedPrimitives{
            i: 10,
            b: true,
            s: "str",
            a: myAddress(),
            c: emptyCell(),
            sl: emptyCell().asSlice()
        };
    }
}