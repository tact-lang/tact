struct InnerA {
    a1: Int;
    a2: Bool?;
    a3: Int?;
    a4: Bool;
}

struct InnerB {
    b1: Bool?;
    b2: Int?;
    b3: Bool;
    b4: Int;
}

struct Outer {
    first: InnerA;
    second: InnerB;
}

contract Test {
    deep: Outer;
    init() {
        self.deep = Outer{
            first: InnerA{a1:1,a2:null,a3:null,a4:true},
            second: InnerB{b1:null,b2:null,b3:false,b4:2}
        };
    }
}