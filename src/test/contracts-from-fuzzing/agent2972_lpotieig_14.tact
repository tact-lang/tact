struct DeepInner {
    val: Int? = null;
}

struct Mid {
    deep: DeepInner? = DeepInner{};
}

struct Top {
    mid: Mid? = null;
}

contract MultiNestedOptionals {
    data: Top;

    init() {
        self.data = Top{}; // default applies
    }
}
