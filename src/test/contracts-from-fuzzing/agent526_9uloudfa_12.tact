struct MixedSerialization {
    small: Int as uint4;
    mid: Int as int32;
    big: Int;
    flag: Bool;
    text: String;
}

contract MixedSerializeTest {
    stuff: MixedSerialization;

    init() {
        self.stuff = MixedSerialization{
            small: 5,
            mid: -77,
            big: 123456789,
            flag: true,
            text: "hello",
        };
    }

    receive() {}
}