struct OptionalMix {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int;
    e: Bool;
    f: String;
}

contract MixOptionalFields {
    dat: OptionalMix;

    init() {
        self.dat = OptionalMix{
            a:null, b:true, c:null,
            d:42, e:false, f:"ok",
        };
    }
}