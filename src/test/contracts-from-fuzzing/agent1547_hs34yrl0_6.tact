struct Serializer {
    bigInt: Int as int257;
    smallInt: Int as int8;
    uInt: Int as uint64;
    flag: Bool;
    text: String;
}

contract SerializeTest {
    data: Serializer;

    init() {
        self.data = Serializer{
            bigInt: -100,
            smallInt: 7,
            uInt: 9999,
            flag: false,
            text: "serialize me"
        };
    }
}