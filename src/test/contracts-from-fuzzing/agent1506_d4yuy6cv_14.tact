struct Sub {
    s: String;
    n: Int;
}

contract Test {
    s1: Sub;
    optSub: Sub?;
    init() {
        self.s1 = Sub{s:"x", n:1};
        self.optSub = null;
    }
}
// test optional entire struct in persistent storage