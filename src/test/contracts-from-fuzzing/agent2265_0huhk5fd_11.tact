struct VariousSerialized {
    bigInt: Int as int257;
    smallUnsigned: Int as uint4;
    midSigned: Int as int32;
    optionalShort: Int? as uint8;
    flag: Bool;
}

contract SerialFormats {
    data: VariousSerialized;

    init() {
        self.data = VariousSerialized{
            bigInt: 0,
            smallUnsigned: 12,
            midSigned: -1000,
            optionalShort: null,
            flag: true,
        };
    }
}