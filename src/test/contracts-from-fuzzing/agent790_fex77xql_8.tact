struct OptionWithSerialization {
    a: Int as int64;
    b: Int?;
    c: Int? as uint32;
}

contract OptionalSerialized {
    data: OptionWithSerialization;

    init() {
        self.data = OptionWithSerialization{a:1, b:null, c:null};
    }
}