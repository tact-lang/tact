struct InnerMost {
    val: Int;
}

struct Mid {
    sub: InnerMost;
}

struct Outer {
    sub: Mid;
}

contract TestContract {
    deep: Outer;
    init() {
        self.deep = Outer{ sub: Mid{ sub: InnerMost{ val: 1 } } };
    }
}