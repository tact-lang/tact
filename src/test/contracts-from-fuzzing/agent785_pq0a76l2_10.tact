struct Middle {
    ai: Int;
    ab: Bool;
    ac: String;
}

struct Outer {
    m1: Middle;
    m2: Middle;
    m3: Middle;
}

contract NestedStructs {
    state: Outer;
    init() {
        self.state = Outer {
            m1: Middle{ ai: 1, ab: true, ac: "a" },
            m2: Middle{ ai: 2, ab: false, ac: "b" },
            m3: Middle{ ai: 3, ab: true, ac: "c" }
        };
    }
}
