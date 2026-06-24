struct SDeep {
    level1: Int;
    level2: Int?;
    level3: String;
    level4: Bool?;
}

struct SNest {
    a: SDeep;
    b: SDeep;
    c: SDeep;
    d: SDeep;
}

contract MultiDeepNestedStructTest {
    d1: SNest;
    d2: SNest;
    init() {
        self.d1 = SNest{
            a:SDeep{level1:1,level2:null,level3:"a",level4:null},
            b:SDeep{level1:2,level2:null,level3:"b",level4:true},
            c:SDeep{level1:3,level2:null,level3:"c",level4:false},
            d:SDeep{level1:4,level2:null,level3:"d",level4:null}
        };
        self.d2 = SNest{
            a:SDeep{level1:5,level2:null,level3:"e",level4:true},
            b:SDeep{level1:6,level2:null,level3:"f",level4:false},
            c:SDeep{level1:7,level2:null,level3:"g",level4:null},
            d:SDeep{level1:8,level2:null,level3:"h",level4:true}
        };
    }
}
