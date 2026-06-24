struct OptionalsAndNormal {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract MixOptionalNormal {
    o: OptionalsAndNormal;

    init() {
        self.o = OptionalsAndNormal{
            a:1, b:null, c:true, d:null, e:"hi", f:null
        };
    }
}