struct InnerStruct {
    x: Int;
    y: Bool;
    z: String;
}

contract StructStorage {
    point: InnerStruct;
    init() {
        self.point = InnerStruct{
            x: 10,
            y: true,
            z: "abc",
        };
    }
}