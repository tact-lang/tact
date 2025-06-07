struct NestedStruct {
    x: Int;
    y: Bool;
    z: String;
}

contract Test2 {
    s: NestedStruct;

    init() {
        self.s = NestedStruct{
            x: 42,
            y: false,
            z: "hello"
        };
    }
}
