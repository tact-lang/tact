struct InnerMost {
    value: Int;
}

struct Middle {
    inmost: InnerMost?;
}

struct Outer {
    medi: Middle?;
}

contract TestContract {
    deep: Outer?;

    init() {
        self.deep = Outer{ medi: null };
    }
}
