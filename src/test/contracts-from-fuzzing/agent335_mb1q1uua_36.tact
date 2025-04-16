struct OptionalWithSerialization {
    a: Int? as int64;
    b: Bool?;
    c: String?;
}

contract OptSerializationDefaults {
    data: OptionalWithSerialization;

    init() {
        self.data = OptionalWithSerialization{
            a:null, b:null, c:null
        };
    }
}