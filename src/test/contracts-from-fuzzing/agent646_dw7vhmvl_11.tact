struct MixedPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;
}

contract MixedPrimitivesTest {
    data: MixedPrimitives;

    init() {
        self.data = MixedPrimitives{
            a: 7,
            b: true,
            c: "hello",
            d: emptyCell().asSlice(),
            e: emptyCell(),
            f: myAddress()
        };
    }
}