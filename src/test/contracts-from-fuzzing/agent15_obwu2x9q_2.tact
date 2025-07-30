struct NestedStruct {
    a: Int;
    b: Int?;
    c: Bool;
}

contract UsesNested {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            a: 10,
            b: null,
            c: true,
        };
    }
}