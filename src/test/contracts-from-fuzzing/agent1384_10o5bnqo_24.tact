struct InnerA {
    a: Int;
    b: Bool;
}

struct InnerB {
    c: Int;
    d: Bool?;
}

struct Outer {
    ia: InnerA;
    ib: InnerB;
}

contract MultiNest {
    d: Outer;

    init() {
        self.d = Outer{
            ia: InnerA{a:1,b:true},
            ib: InnerB{c:2,d:null},
        };
    }
}