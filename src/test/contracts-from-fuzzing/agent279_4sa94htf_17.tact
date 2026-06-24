struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    x: S1;
    y: Int;
}

contract LevelChain {
    l1: S2;

    init() {
        self.l1 = S2{x:S1{a:1,b:true}, y:100};
    }
}