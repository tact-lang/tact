struct StructWithSerialization {
    a: Int as uint32;
    b: Int as int64;
    c: Bool;
    s: String;
}

contract SerializedContractFields {
    item: StructWithSerialization;

    init() {
        self.item = StructWithSerialization{
            a: 123,
            b: -4567,
            c: true,
            s: "hi"
        };
    }
}