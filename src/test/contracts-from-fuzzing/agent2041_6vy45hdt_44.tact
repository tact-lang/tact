struct MixDefaults {
    a: Int = 1;
    b: Bool;
    c: String = "hi";
    d: Int?;
    e: String?;
}

contract MDefaults {
    s: MixDefaults;
    init() {
        self.s = MixDefaults{
            b:true,
            d:null,
            e:null,
        };
    }
}