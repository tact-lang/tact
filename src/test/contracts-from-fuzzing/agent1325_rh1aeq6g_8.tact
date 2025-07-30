struct LeafA { val: Int; }
struct LeafB { val: Int; }
struct Middle {
    a: LeafA;
    b: LeafB;
}

contract ManyStructs {
    s: Middle;

    init() {
        self.s = Middle{
            a: LeafA{val:1},
            b: LeafB{val:2}
        };
    }
}