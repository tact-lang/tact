struct InnerMost {
    a: Int;
    flag: Bool?;
}

struct Mid {
    inner: InnerMost?;
    val: Int;
}

contract OptionalNested {
    m: Mid?;

    init() {
        self.m = null;
    }
}