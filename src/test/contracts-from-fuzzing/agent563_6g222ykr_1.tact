struct Inner {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
}

contract NestedStorage {
    nested: Inner;

    init() {
        self.nested = Inner{
            a: 10,
            b: true,
            c: "hi",
            d: emptyCell(),
        };
    }
}