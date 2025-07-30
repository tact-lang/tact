struct MixedPrimitives {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    bu: Builder;
    a: Address;
}

contract MixedPrimitivesContract {
    p1: MixedPrimitives;
    p2: MixedPrimitives;

    init() {
        self.p1 = MixedPrimitives{
            i: 10,
            b: true,
            s: "hello",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            bu: beginCell(),
            a: myAddress()
        };

        self.p2 = MixedPrimitives{
            i: 20,
            b: false,
            s: "world",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            bu: beginCell(),
            a: myAddress()
        };
    }
}
