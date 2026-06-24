struct DeepInner {
    x: Int;
    y: Bool;
}

struct Middle {
    d1: DeepInner;
    d2: DeepInner;
}

struct Outer {
    m: Middle;
    flag: Bool;
}

contract TestContract {
    state: Outer;

    init() {
        self.state = Outer{
            m: Middle{
                d1: DeepInner{x: 1, y: true},
                d2: DeepInner{x: 2, y: false},
            },
            flag: true,
        };
    }
}
