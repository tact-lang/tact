struct InnerMost {
    val: Int;
}

struct Middle {
    inner: InnerMost;
}

struct Outer {
    mid: Middle;
}

contract DeepDeep {
    data: Outer;
    init() {
        self.data = Outer{ mid: Middle{ inner: InnerMost{ val: 99 } } };
    }
    receive() {}
}