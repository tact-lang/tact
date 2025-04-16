struct SSub {
    a: Int;
}

struct SMain {
    sub: SSub;
    b: Int;
}

contract LargeChain {
    s1: SMain;
    s2: SMain;
    s3: SMain;

    init() {
        self.s1 = SMain{sub:SSub{a:1},b:2};
        self.s2 = SMain{sub:SSub{a:3},b:4};
        self.s3 = SMain{sub:SSub{a:5},b:6};
    }
}