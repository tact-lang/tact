struct S1 {
    f: Int?;
}

struct S2 {
    s: S1?;
}

contract OptStructChain {
    val: S2;

    init() {
        self.val = S2 {
            s: null
        };
    }
}