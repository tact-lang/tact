struct DeepMany {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
}

contract MassMix {
    m: DeepMany;
    init() {
        self.m = DeepMany{
            a:1, b:true, c:"c", d:null, e:null, f:null,
            g:2, h:false, i:"zzz"
        };
    }
}