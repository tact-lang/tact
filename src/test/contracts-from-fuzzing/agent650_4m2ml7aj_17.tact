// test many optional nested inside optional contract field
struct InnerMost {
    val: Bool?;
}

struct Mid {
    inner: InnerMost?;
}

struct Outer {
    mid: Mid?;
}

contract TestContract {
    outer: Outer?;

    init() {
        self.outer = null;
    }
}
