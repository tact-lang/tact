struct NestedStruct {
    x: Int;
    y: Int?;
    z: Bool;
}

contract StructFieldContract {
    data: NestedStruct = NestedStruct{x: 1, y: null, z: true};

    init() {
        self.data = NestedStruct{x: 5, y: 10, z: false};
    }
}