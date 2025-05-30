struct S1 {
    x: Int;
    y: Bool;
}

struct S2 {
    msg: String;
    sub: S1;
}

contract TestContract {
    p1: S1;
    p2: S2;

    init() {
        self.p1 = S1{x:1,y:true};
        self.p2 = S2{msg:"x", sub:S1{x:2,y:false}};
    }
}