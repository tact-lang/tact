struct NestedStruct {
    x: Int;
    y: Bool;
    z: String;
}

contract NestedStructState {
    point: NestedStruct;

    init() {
        self.point = NestedStruct{ x: 5, y: false, z: "nested" };
    }
}