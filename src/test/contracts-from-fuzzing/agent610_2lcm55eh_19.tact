// Contract with many nested optional structs with defaults
struct InnerMost {
    z: Int? = null;
}

struct InnerMid {
    y: InnerMost = InnerMost{};
}

struct Inner {
    x: InnerMid? = null;
}

contract ManyOptionalNest {
    val: Inner?;

    init() {
        self.val = null;
    }
}