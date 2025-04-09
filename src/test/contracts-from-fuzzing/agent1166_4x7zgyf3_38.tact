// Optional struct chain with mixed defaulting
struct P1 {
    a: Int?;
    b: Int = 99;
}

struct P2 {
    f: P1?;
}

contract OptChainDefaults {
    p: P2;
    init() {
        self.p = P2{
            f: null
        };
    }
}
