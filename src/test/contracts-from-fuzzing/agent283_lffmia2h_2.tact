struct NestedStruct {
    x: Int;
    y: Bool?;
    z: String;
}

contract C {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            x: 42,
            y: null,
            z: "hello"
        };
    }
}