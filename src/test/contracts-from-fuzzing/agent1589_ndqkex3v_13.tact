struct SerializeTest {
    a: Int as uint8;
    b: Int as int32;
    c: Bool;
    d: String;
}

contract SerializeFields {
    value: SerializeTest;

    init() {
        self.value = SerializeTest{
            a: 1,
            b: -42,
            c: true,
            d: "test",
        };
    }
}