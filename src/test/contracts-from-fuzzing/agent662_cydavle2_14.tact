struct MixStruct {
    a: Int as int64;
    b: Int as uint16;
    c: Int;
    d: Bool;
    e: String;
}

contract MixSerializationContract {
    data: MixStruct;
    init() {
        self.data = MixStruct{ a:1, b:2, c:3, d:true, e:"mix" };
    }
}