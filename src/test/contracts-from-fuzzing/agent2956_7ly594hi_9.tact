struct SerialTest {
    int1: Int as uint8;
    int2: Int as int16;
    int3: Int as uint256;
    bool1: Bool;
    optInt: Int?;
    optBool: Bool?;
    txt: String;
}

contract Serializer {
    s: SerialTest;

    init() {
        self.s = SerialTest{
            int1: 5,
            int2: -256,
            int3: 1000000000000,
            bool1: true,
            optInt: null,
            optBool: null,
            txt: "serialization",
        };
    }
}
