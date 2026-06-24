struct SerialStruct {
    int4: Int as int4;
    uint12: Int as uint12;
    int66: Int as int66;
}

contract SerialStructTest {
    val: SerialStruct;

    init() {
        self.val = SerialStruct{
            int4: -8,
            uint12: 4095,
            int66: 100000000000
        };
    }
}