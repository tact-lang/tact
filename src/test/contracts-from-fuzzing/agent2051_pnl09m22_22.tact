struct InnerMost {
    val: Int;
}

struct Mid {
    inside: InnerMost;
}

struct Outer {
    mid: Mid;
}

contract InitNestedDefaults {
    val: Outer;

    init() {
        self.val = Outer{ mid: Mid{ inside: InnerMost{ val: 123 } } };
    }
}