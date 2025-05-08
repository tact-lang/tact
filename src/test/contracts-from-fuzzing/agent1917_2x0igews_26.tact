struct InnerA {
    a: Int;
}
struct InnerB {
    b: Int;
}
struct Middle {
    iA: InnerA;
    iB: InnerB;
}
contract ManyNestKinds {
    m: Middle;

    init() {
        self.m = Middle{
            iA: InnerA{a:1},
            iB: InnerB{b:2},
        };
    }
}
