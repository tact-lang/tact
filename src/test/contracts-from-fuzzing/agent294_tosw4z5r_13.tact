struct Serialized {
    smallInt: Int as uint32;
    bigInt: Int as int64;
}

contract SerializeTest {
    data: Serialized;

    init() {
        self.data = Serialized{
            smallInt: 1000,
            bigInt: -1000
        };
    }
}
