struct MixedSerialization {
    i64: Int as int64;
    u32: Int as uint32;
    defaultInt: Int;
    str: String;
    flag: Bool;
}

contract SerializedStructTest {
    data: MixedSerialization;
    
    init() {
        self.data = MixedSerialization{
            i64: 123456789,
            u32: 40000,
            defaultInt: -42,
            str: "Hello",
            flag: true
        };
    }
}