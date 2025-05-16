// test serialization annotations
struct Serialized {
    a: Int as int64;
    b: Int as uint32;
    c: Bool;
    d: String;
}

contract SerializedFieldsTest {
    s: Serialized;

    init() {
        self.s = Serialized{
            a: -42,
            b: 123,
            c: true,
            d: "str",
        };
    }
}