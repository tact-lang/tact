// Check large contract with varied serialization formats
contract MixedSerialization {
    intDefault: Int;
    int64v: Int as int64;
    uint8v: Int as uint8;
    bigInt: Int;
    shortInt: Int as int16;
    flag: Bool;
    text: String;
    optInt: Int?;
    optText: String?;

    init() {
        self.intDefault = 0;
        self.int64v = 1;
        self.uint8v = 2;
        self.bigInt = 123456789;
        self.shortInt = -1234;
        self.flag = true;
        self.text = "txt";
        self.optInt = null;
        self.optText = null;
    }
}
