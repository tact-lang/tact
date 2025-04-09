struct NestedStruct {
    x: Int;
    y: String;
    z: Bool?;
}

contract TestContract {
    val: NestedStruct;

    init() {
        self.val = NestedStruct{
            x: 42,
            y: "hello",
            z: null,
        };
    }
}