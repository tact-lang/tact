struct NestedStruct {
    x: Int;
    y: Bool;
    z: String;
}

contract StructInContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{x: 1, y: true, z: "hello"};
    }
}
