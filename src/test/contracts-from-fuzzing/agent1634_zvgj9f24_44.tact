struct OptionalWithSerialize {
    a: Int? as uint32;
    b: Bool?;
}

contract OptSerializeStructField {
    s: OptionalWithSerialize;

    init() {
        self.s = OptionalWithSerialize{ a:null, b:null };
    }
}