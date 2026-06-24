struct Pair {
    a: Int? = null;
    b: Int? = null;
}

struct Wrap {
    p: Pair? = null;
}

contract NestedOptDefaults {
    f: Wrap = Wrap{};

    init() {
        self.f = Wrap{};
    }
}
