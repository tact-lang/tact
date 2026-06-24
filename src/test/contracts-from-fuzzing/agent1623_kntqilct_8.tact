struct OptionalNested {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
}

contract OptionalNestedStorage {
    bar: OptionalNested;
    
    init() {
        self.bar = OptionalNested{
            a: 10,
            b: false,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
        };
    }
}