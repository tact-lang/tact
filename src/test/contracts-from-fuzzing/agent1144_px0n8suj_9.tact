struct SerializeTest {
    smallInt: Int as uint8;
    signedInt: Int as int16;
    maxInt: Int as int257;
}

contract SerializeTestContract {
    data: SerializeTest;

    init() {
        self.data = SerializeTest{
            smallInt: 255,
            signedInt: -12345,
            maxInt: 0
        };
    }
}