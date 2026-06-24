struct Sub1 {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
}

struct Sub2 {
    e: Bool;
    f: String;
    g: Int?;
    h: Bool;
}

struct BothTogether {
    first: Sub1;
    second: Sub2;
    flag: Bool;
    text: String?;
}

contract HoldComplex {
    combo: BothTogether;
    
    init() {
        self.combo = BothTogether{
            first: Sub1{ a:1, b:true, c:"hi", d:null },
            second: Sub2{ e:false, f:"bye", g:null, h:true },
            flag: true,
            text: null
        };
    }
}