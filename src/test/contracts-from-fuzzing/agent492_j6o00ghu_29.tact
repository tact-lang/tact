struct Innermost {
    val: Int? = null;
}

struct MiddleNest {
    nested: Innermost = Innermost{};
}

struct OuterMost {
    middle: MiddleNest = MiddleNest{};
}

contract DeepDefaults {
    payload: OuterMost;
    init() {
        self.payload = OuterMost{};
    }
}
