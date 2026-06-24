struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
}

contract MixTypes {
    storage: S;

    init() {
        self.storage = S{
            a: 42,
            b: true,
            c: "test",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
        };
    }
}
