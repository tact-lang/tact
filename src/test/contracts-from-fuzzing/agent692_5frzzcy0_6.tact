struct Sub {
    a: Int;
    b: Bool;
}

struct SubOpt {
    optSub: Sub?;
}

contract Combo {
    s: SubOpt;

    init() {
        self.s = SubOpt{ optSub: null };
    }
}