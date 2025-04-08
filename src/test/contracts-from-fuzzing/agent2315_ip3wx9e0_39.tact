struct Innermost {
    val: Int = 123;
}

struct Middle {
    deep: Innermost = Innermost{};
}

struct OuterMost {
    mid: Middle = Middle{};
}

contract DeepDefaults {
    base: OuterMost;

    init() {
        self.base = OuterMost{};
    }
}