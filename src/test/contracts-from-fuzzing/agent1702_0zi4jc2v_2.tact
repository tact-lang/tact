struct NestedStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
}

contract TestContract {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            a: 42,
            b: true,
            c: "hello",
            d: emptyCell(),
        };
    }
}