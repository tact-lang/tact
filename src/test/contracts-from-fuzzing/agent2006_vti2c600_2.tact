struct NestedStruct {
    x: Int;
    y: String;
    z: Bool?;
}

contract NestedContract {
    coord: NestedStruct;
    init() {
        self.coord = NestedStruct {
            x: 1,
            y: "test",
            z: true,
        };
    }
}