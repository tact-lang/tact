struct NestedStruct {
    x: Int;
    y: Int?;
    z: Bool;
}

contract DeepContract {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{ x: 1, y: null, z: true };
    }
}