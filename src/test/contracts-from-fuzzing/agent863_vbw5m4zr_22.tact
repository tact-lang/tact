struct InnerS {
    f1: Int;
    f2: Int;
}

struct OuterS {
    inn: InnerS;
    f3: Int;
    f4: Bool;
}

contract Overlap {
    s: OuterS;

    init() {
        self.s = OuterS{ inn: InnerS{ f1:1, f2:2 }, f3:3, f4:true };
    }
}