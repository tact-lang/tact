// Optional struct field of struct which itself is optional
struct Leaf {
    a: Int;
}

struct Mid {
    l: Leaf?;
}

contract OptionalDoubleWrap {
    root: Mid?;
    init() {
        self.root = null;
    }
}
