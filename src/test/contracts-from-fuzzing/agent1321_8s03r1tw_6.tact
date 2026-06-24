struct Inner {
    val: Int;
}

struct Mid {
    nested: Inner?;
}

struct Top {
    mid: Mid;
}

contract OptDeep {
    complex: Top;
    init() {
        self.complex = Top{ mid: Mid{ nested: null } };
    }
}