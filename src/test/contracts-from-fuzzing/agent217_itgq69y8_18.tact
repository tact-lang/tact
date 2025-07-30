struct Sub1 {
    a: Int;
    b: String?;
}

struct Sub2 {
    c: Bool;
    d: Int?;
}

struct TopMix {
    s1: Sub1;
    flag: Bool;
    s2: Sub2;
}

contract MixedBag {
    store: TopMix;

    init() {
        self.store = TopMix{
            s1: Sub1{a: 1, b: null},
            flag: true,
            s2: Sub2{c: false, d: null}
        };
    }
}