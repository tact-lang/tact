struct SerialStruct {
    x: Int as uint32;
    y: Bool;
    z: Int as int64;
}

contract SerialStructTest {
    data: SerialStruct;
    init() {
        self.data = SerialStruct{ x: 42, y: true, z: -33 };
    }
}