struct NestedDefaults {
    a: WithDefaults;
}

struct WithDefaults {
    x: Int = 1;
    y: Bool = true;
    s: String = "abc";
}

contract NestedDefaultValues {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{
            a: WithDefaults{},
        };
    }
}
