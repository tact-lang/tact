struct HasManyPrim {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
}

contract ManyPrimTest {
    data: HasManyPrim;

    init() {
        self.data = HasManyPrim{
            a: 2,
            b: true,
            c: "def",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell(),
        };
    }
}
