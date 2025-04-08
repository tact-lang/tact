struct MixedSerialization {
    intA: Int as uint4;
    intB: Int as int8;
    bigInt: Int as uint256;
    optInt: Int?;
    boolA: Bool;
    strA: String;
}

contract SerializeMix {
    s: MixedSerialization;

    init() {
        self.s = MixedSerialization{
            intA: 3,
            intB: -5,
            bigInt: 12345678901234567890,
            optInt: null,
            boolA: true,
            strA: "serialize",
        };
    }
}
