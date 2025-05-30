struct InnerDefaults {
    a: Int = 10;
    b: Bool = true;
}

struct WithInnerDefaults {
    inner1: InnerDefaults = InnerDefaults{};
    inner2: InnerDefaults? = null;
    c: String = "foo";
}

contract Test25 {
    data: WithInnerDefaults;

    init() {
        self.data = WithInnerDefaults{};
    }
}