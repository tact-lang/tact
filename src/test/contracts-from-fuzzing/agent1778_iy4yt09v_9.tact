struct S1 {
    f1: Int;
}

struct S2 {
    s1: S1;
    f2: Bool;
}

contract StructChainOpt {
    rec: S2?;

    init() {
        self.rec = S2{s1:S1{f1:5}, f2:true};
    }
}