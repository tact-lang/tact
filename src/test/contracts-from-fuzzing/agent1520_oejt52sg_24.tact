struct Texts {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
    f: String;
}

struct Bools {
    aa: Bool;
    bb: Bool;
    cc: Bool;
    dd: Bool;
    ee: Bool;
    ff: Bool;
}

struct Combo {
    txts: Texts;
    bls: Bools;
}

contract NestedType {
    state: Combo;
    init() {
        self.state = Combo{
            txts: Texts{ a:"a",b:"b",c:"c",d:"d",e:"e",f:"f" },
            bls: Bools{ aa:true, bb:false, cc:true, dd:false, ee:true, ff:false }
        };
    }
}