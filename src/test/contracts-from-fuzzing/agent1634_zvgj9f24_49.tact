struct NestedMixedSerializations {
    a: Int as int4;
    b: Int? as uint8;
    c: Bool;
    d: String?;
}

contract NestedMixedSerializationContract {
    mixed: NestedMixedSerializations;

    init() {
        self.mixed = NestedMixedSerializations{ a:3, b:null, c:true, d:null };
    }
}