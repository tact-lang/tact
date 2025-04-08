struct NestedDeep {
    level1: Int;
}

struct Middle {
    next: NestedDeep;
}

struct Outer {
    mid: Middle;
}

contract DeepNesting {
    f: Outer;
    init() {
        self.f = Outer{mid: Middle{next: NestedDeep{level1: 42}}};
    }
}

contract Call {
    receive() {
        let dummy: DeepNesting? = null;
    }
}