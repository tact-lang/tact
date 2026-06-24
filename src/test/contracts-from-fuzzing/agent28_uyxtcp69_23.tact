struct DeepInner {
    q: Int = 42;
}

struct Mid {
    inner: DeepInner? = DeepInner{};
    label: String = "X";
}

struct Top {
    m: Mid? = Mid{};
}

contract ChainDefault {
    nested: Top;

    init() {
        self.nested = Top{};
    }
}