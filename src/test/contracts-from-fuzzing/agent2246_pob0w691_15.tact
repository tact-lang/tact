struct SerializeTest {
    small: Int as uint8;
    big: Int;
    signed: Int as int16;
}

contract StructSerialize {
    val: SerializeTest;

    init() {
        self.val = SerializeTest{
            small: 200,
            big: 99999999,
            signed: -20
        };
    }
}
