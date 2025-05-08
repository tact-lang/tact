struct NestedDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
}

struct OuterDef {
    inner: NestedDefaults = NestedDefaults{};
    y: Int = 42;
}

contract NestedDefContract {
    data: OuterDef;

    init() {
        self.data = OuterDef{};
    }
}