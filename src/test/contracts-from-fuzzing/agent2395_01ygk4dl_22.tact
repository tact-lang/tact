struct SerializationStruct {
    x: Int as uint8;
    y: Int as int64;
    z: Int as uint256;
}

contract SerializeFieldsTest {
    val: SerializationStruct;

    init() {
        self.val = SerializationStruct{
            x: 1,
            y: 2,
            z: 3
        };
    }
}
