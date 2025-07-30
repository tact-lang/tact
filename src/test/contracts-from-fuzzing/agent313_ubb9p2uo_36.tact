struct ManyMix {
    aa: Int;
    bb: Bool;
    cc: String?;
    dd: Int; 
    ee: Bool?;
    ff: String;
    gg: Int?;
}

contract MixFields {
    val: ManyMix;

    init() {
        self.val = ManyMix{
            aa: 1,
            bb: false,
            cc: null,
            dd: 5,
            ee: true,
            ff: "hello",
            gg: null
        };
    }
}