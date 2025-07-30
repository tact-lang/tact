struct NestedDefaults {
    x: Int = 5;
    y: Bool = true;
}

struct WithNestedDefault {
    inner: NestedDefaults = NestedDefaults{};
    flag: Bool = false;
}

contract DefaultsInNestedStruct {
    data: WithNestedDefault;

    init() {
        self.data = WithNestedDefault{};
    }
}