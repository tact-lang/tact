struct S {
    a: Int;
    b: Bool = true;
    c: Int?;
    d: Address?;
    e: Cell;
    f: Slice;
    g: String;
}

contract MixedFields {
    mixed: S;

    init() {
        self.mixed = S{
            a: 1,
            c: 123,
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: "hi"
        };
    }

    receive() {
        self.mixed = S{
            a: 2,
            c: null,
            d: null,
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: "bye"
        };
    }
}