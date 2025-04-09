struct NestedStruct {
    x: Int;
    y: Int?;
    z: String;
}

contract TestContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            x: 1,
            y: null,
            z: "hello"
        };
    }
}