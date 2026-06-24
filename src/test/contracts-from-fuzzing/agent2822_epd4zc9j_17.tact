struct InnerMost {
    x: Int;
}

struct Middle {
    m: InnerMost;
}

struct Outer {
    o: Middle;
}

contract OptionalDeep {
    val: Outer?;
    init() {
        self.val = null;
    }
}