struct OutMost {
    inner1: Mid1;
    inner2: Mid2;
}

struct Mid1 {
    a: Int;
    b: Bool;
    c: InnerMost;
}

struct Mid2 {
    d: String;
    e: Address;
    f: InnerMost;
}

struct InnerMost {
    x: Int;
    y: Bool;
}

contract Test39 {
    val: OutMost;
    init() {
        self.val = OutMost{
            inner1: Mid1{a:1,b:true,c:InnerMost{x:2,y:false}},
            inner2: Mid2{d:"hi",e:myAddress(),f:InnerMost{x:3,y:true}}
        };
    }
}