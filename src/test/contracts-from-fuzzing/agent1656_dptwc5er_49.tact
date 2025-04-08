struct SerializeStruct {
    x: Int as uint4;
    y: Int as int8;
    z: Int as uint32;
}

contract SerializeStructTest {
    data: SerializeStruct;
    init() {
        self.data = SerializeStruct{
            x: 7,
            y: -8,
            z: 100000,
        };
    }
}
