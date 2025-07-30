struct BigNested {
    a: Int;
    b: String;
    c: Int?;
    d: String?;
    e: Int;
    f: String;
    g: Int?;
    h: String?;
}

struct BiggerNested {
    one: BigNested;
    two: BigNested;
    three: BigNested;
}

contract ComplexStorage {
    data: BiggerNested;

    init() {
        self.data = BiggerNested{
            one: BigNested{a:1, b:"b1", c:null, d:null, e:2, f:"f1", g:null, h:null},
            two: BigNested{a:3, b:"b2", c:null, d:null, e:4, f:"f2", g:null, h:null},
            three: BigNested{a:5, b:"b3", c:null, d:null,e:6,f:"f3",g:null,h:null}
        };
    }
}
