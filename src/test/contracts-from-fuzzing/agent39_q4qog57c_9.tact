struct SerializeTest {
    val1: Int as uint8;
    val2: Int as int4;
    val3: Int as uint16;
    flag: Bool;
}

contract TestContract {
    s: SerializeTest;

    init() {
        self.s = SerializeTest{
            val1: 255,
            val2: -8,
            val3: 65535,
            flag: true
        };
    }
}