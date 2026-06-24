struct Mix {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
    g: Builder;
}

contract TestContract {
    field: Mix;

    init() {
        self.field = Mix{
            a: 5,
            b: true,
            c: myAddress(),
            d: "hello",
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell(),
        };
    }
}
