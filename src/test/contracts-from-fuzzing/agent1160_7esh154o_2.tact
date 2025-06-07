struct Inner {
    x: Int;
    y: Bool;
}

struct Middle {
    inr: Inner;
    flag: Bool;
}

struct Outer {
    mid: Middle;
    num: Int;
}

contract DeepNest {
    state: Outer;

    init() {
        self.state = Outer{
            mid: Middle{inr: Inner{x: 7, y: true}, flag: false},
            num: 123
        };
    }
}