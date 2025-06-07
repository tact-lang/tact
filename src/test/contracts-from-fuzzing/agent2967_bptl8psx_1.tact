struct InnerStruct {
    x: Int;
    y: Bool;
}

contract SimpleNested {
    nested: InnerStruct;

    init() {
        self.nested = InnerStruct{ x: 10, y: true };
    }
}