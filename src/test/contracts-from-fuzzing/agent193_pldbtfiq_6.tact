struct Inner {
    a: Int;
}

struct Middle {
    inr: Inner;
}

struct Outer {
    mid: Middle;
}

contract DeeplyNested {
    x: Outer;

    init() {
        self.x = Outer{mid: Middle{inr: Inner{a: 33}}};
    }
}