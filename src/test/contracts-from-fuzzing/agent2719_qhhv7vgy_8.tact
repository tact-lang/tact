struct InnerMost {
    x: Int;
    y: String;
}

struct Middle {
    m1: InnerMost?;
    m2: Bool;
}

struct Outer {
    o1: Middle;
    o2: Int;
}

contract TestContract {
    state: Outer;

    init() {
        self.state = Outer{
            o1: Middle{
                m1: InnerMost{ x: 1, y: "hi" },
                m2: true
            },
            o2: 5
        };
    }
}