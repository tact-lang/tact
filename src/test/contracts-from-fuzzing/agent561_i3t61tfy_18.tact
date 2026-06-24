struct SubStructA {
    a: Int;
    b: Bool;
}

struct SubStructB {
    c: String;
    d: Int?;
}

struct SubStructC {
    e: Bool?;
    f: String?;
}

struct BigNested {
    sa: SubStructA;
    sb: SubStructB;
    sc: SubStructC;
}

contract BigNestedStructStorage {
    data: BigNested;

    init() {
        self.data = BigNested{
            sa: SubStructA{a:1,b:true},
            sb: SubStructB{c:"c",d:null},
            sc: SubStructC{e:null,f:null}
        };
    }
}