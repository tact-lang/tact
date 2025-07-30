struct InnerMost {
    x: Int;
}

struct MiddleFallback {
    nested: InnerMost;
}

contract TestOptionalOfStruct {
    val: MiddleFallback?;
    init() {
        self.val = null;
    }
}