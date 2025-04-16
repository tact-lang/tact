struct InnerDefaults {
    a: Int = 5;
    b: Bool = false;
}

struct OuterDefaults {
    inner: InnerDefaults = InnerDefaults{};
    name: String = "default";
    enabled: Bool = true;
}

contract DefaultedNested {
    state: OuterDefaults;

    init() {
        self.state = OuterDefaults{};
    }
}