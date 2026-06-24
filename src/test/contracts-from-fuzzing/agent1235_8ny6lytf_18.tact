struct InnerMost {
    val: Int;
}

struct MiddleMost {
    inner: InnerMost;
    text: String?;
}

struct OuterMost {
    mid: MiddleMost;
    flag: Bool;
}

contract OptDeep {
    nested: OuterMost?;

    init() {
        self.nested = null;
    }
}