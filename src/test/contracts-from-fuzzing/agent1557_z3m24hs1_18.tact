struct Diverse {
    foo: Int;
    bar: String?;
    baz: Bool;
    qux: Cell?;
    quux: Slice;
    corge: Address?;
}

contract DiverseTypes {
    data: Diverse;

    init() {
        self.data = Diverse{
            foo: 123,
            bar: null,
            baz: true,
            qux: null,
            quux: emptyCell().asSlice(),
            corge: null
        };
    }
}