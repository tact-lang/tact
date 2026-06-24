struct InnerMost {
    val: Int;
}

struct Middle {
    val: InnerMost;
}

struct Outer {
    val: Middle;
}

contract MultiLevel {
    outer: Outer;

    init() {
        self.outer = Outer{ val: Middle{val: InnerMost{val: 123}} };
    }
}