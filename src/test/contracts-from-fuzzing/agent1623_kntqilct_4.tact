struct InnerStruct {
    x: Int;
    y: Bool;
    z: Address;
}

contract StructStorage {
    point: InnerStruct;

    init() {
        self.point = InnerStruct{
            x: 10,
            y: true,
            z: myAddress(),
        };
    }
}