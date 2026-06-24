struct Fields {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
}

contract OptionalOfStruct {
    nested: Fields?;
    init() {
        self.nested = Fields{
            a: 42,
            b: false,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
        };
    }
}