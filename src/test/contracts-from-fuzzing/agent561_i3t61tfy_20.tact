struct SubA {
    a: Int;
    b: Bool;
}

struct SubB {
    c: Int?;
    d: String?;
}

struct TopStruct {
    sa: SubA;
    sb: SubB;
    e: Int;
    f: String;
}

contract MixStructsDeep {
    val: TopStruct;

    init() {
        self.val = TopStruct{
            sa: SubA{a:1,b:true},
            sb: SubB{c:null,d:null},
            e: 10,
            f: "xyz"
        };
    }
}