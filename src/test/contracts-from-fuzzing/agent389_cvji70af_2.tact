struct NestedStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
}

contract UsesNested {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            a: 1,
            b: true,
            c: "test",
            d: emptyCell(),
        };
    }
}