// Struct using as-serialization annotations
struct Serialized {
    smallInt: Int as uint8;
    medInt: Int as int64;
    bigInt: Int;
}

contract SerializeTest {
    serialized: Serialized;

    init() {
        self.serialized = Serialized{
            smallInt: 7,
            medInt: 12345678,
            bigInt: 987654321
        };
    }
}