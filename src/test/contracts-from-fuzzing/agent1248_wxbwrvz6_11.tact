struct InnerDefault {
    s: String = "def";
    n: Int? = null;
}

struct OuterDefault {
    flag: Bool = true;
    nested: InnerDefault = InnerDefault{};
}

contract DefaultsNested {
    state: OuterDefault;

    init() {
        self.state = OuterDefault{};
    }
}
