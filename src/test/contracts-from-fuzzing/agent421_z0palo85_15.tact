struct MixNested {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract MixingStruct {
    data: MixNested;
    init() {
        self.data = MixNested {
            a:1, b:null, c:true, d:null, e:"hi", f:null
        };
    }
}