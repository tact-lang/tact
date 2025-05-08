struct AAA {
    flag: Bool;
}

struct BBB {
    aaa: AAA;
}

struct CCC {
    bbb: BBB;
}

contract ChainABC {
    out: CCC;
    init() {
        self.out = CCC{bbb: BBB{aaa: AAA{flag: true}}};
    }
}