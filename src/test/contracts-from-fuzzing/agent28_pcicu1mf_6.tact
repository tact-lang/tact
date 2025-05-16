struct InnerMost {
    val: Int;
}

struct Middle {
    optInner: InnerMost?;
}

struct Outer {
    mid: Middle?;
}

contract NestedOptionals {
    state: Outer;
    init() {
        self.state = Outer{ mid: null };
    }
}