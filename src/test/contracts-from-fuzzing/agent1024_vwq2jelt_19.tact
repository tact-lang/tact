struct MixedNesting {
    a: Int;
    b: InnerA;
    c: InnerB;
}

struct InnerA {
    d: Int;
    e: Bool;
    f: String;
}

struct InnerB {
    g: Bool?;
    h: Int;
    i: InnerC;
}

struct InnerC {
    j: String?;
    k: Int;
}

contract NestMixComplex {
    data: MixedNesting;

    init() {
        self.data = MixedNesting{
            a:1,
            b:InnerA{d:2,e:true,f:"hi"},
            c:InnerB{g:null,h:3,i:InnerC{j:null,k:4}}
        };
    }
}