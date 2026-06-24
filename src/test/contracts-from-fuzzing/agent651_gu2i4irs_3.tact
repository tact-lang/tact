struct Nested {
    a: Int;
    b: Bool?;
    c: String;
    d: Cell;
    e: Slice;
    f: Address?;
}

contract DiverseFields {
    myField: Nested;

    init() {
        self.myField = Nested{
            a: 10,
            b: true,
            c: "hello",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: null
        };
    }
}