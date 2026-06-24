struct SerializerTest {
    i1: Int as uint8;
    i2: Int as int16;
    i3: Int as int257;
    flag: Bool;
    s: String;
}

contract SerializationFormats {
    test: SerializerTest;

    init() {
        self.test = SerializerTest{
            i1: 255,
            i2: -12345,
            i3: 42,
            flag: true,
            s: "hello"
        };
    }
}