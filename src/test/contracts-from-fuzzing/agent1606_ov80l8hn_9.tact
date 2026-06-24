struct MixedSerialization {
    a: Int as uint8;
    b: Int as int64;
    c: Int;
    d: Bool;
    e: Bool?;
    f: String;
}

contract MixedSerializationContract {
    field: MixedSerialization;

    init() {
        self.field = MixedSerialization{
            a:1,
            b:2,
            c:3,
            d:true,
            e:null,
            f:"ok"
        };
    }
}
