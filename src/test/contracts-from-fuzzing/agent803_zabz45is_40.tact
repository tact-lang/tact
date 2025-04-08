struct SerializeFormat {
    small: Int as uint8;
    mid: Int as uint32;
    big: Int;
    flag: Bool;
}

contract SerializationTest {
    data: SerializeFormat;

    init() {
        self.data = SerializeFormat {
            small:5,
            mid:1000,
            big:999999,
            flag:true
        };
    }
}