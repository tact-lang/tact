struct SerTest {
    bigInt: Int as int257;
    smallInt: Int as uint8;
    midInt: Int as int16;
    someCoin: Int as coins;
    someBool: Bool;
}

contract SerializationTest {
    data: SerTest;

    init() {
        self.data = SerTest{
            bigInt: -1,
            smallInt: 255,
            midInt: -1000,
            someCoin: 1000000000,
            someBool: true,
        };
    }
}