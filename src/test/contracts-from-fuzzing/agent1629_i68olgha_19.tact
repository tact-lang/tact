struct MixOptionalNormal {
    a: Int;
    b: String?;
    c: Bool;
    d: Int?;
    e: String;
    f: Bool?;
}

contract MixStructStorage {
    st: MixOptionalNormal;

    init() {
        self.st = MixOptionalNormal{
            a:123,
            b:null,
            c:true,
            d:null,
            e:"str",
            f:false,
        };
    }
}