struct NestedStruct {
    n1: Int;
    n2: Bool;
    n3: String;
    n4: Slice;
}

contract Test2 {
    f1: NestedStruct;

    init() {
        self.f1 = NestedStruct{
            n1: 42,
            n2: true,
            n3: "hello",
            n4: emptyCell().asSlice(),
        };
    }
}