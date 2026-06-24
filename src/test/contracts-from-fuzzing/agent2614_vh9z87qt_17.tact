struct MixOptionalDefaults {
    a: Int?;
    b: Int = 4;
    c: String?;
    d: String = "hi";
    e: Bool?;
    f: Bool = false;
}

contract MixOptionalDefaultsStorage {
    data: MixOptionalDefaults;

    init() {
        self.data = MixOptionalDefaults{
            a:null,
            b:100,
            c:null,
            d:"test",
            e:null,
            f:true
        };
    }
}