struct OptionSerialized {
    a: Int? as int8;
    b: Int? as int64;
    c: Bool?;
}

contract OptionWithSerialization {
    data: OptionSerialized;

    init() {
        self.data = OptionSerialized{ a: null, b: null, c: null };
    }
}