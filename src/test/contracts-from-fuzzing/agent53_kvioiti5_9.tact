struct InnerMost {
    z: Int;
}

struct Mid {
    y: InnerMost;
}

struct Outer {
    x: Mid;
}

contract OptStructNestedOpt {
    data: Outer?;

    init() {
        self.data = null;
    }
}