struct StructA {
    a: Int;
    b: Bool;
}

struct StructB {
    c: Int;
    d: Bool;
}

struct StructC {
    first: StructA;
    second: StructB;
    flag: Bool;
}

contract MultilevelComposition {
    data: StructC;

    init() {
        self.data = StructC{
            first: StructA{a:1,b:true},
            second: StructB{c:2,d:false},
            flag: true
        };
    }
}