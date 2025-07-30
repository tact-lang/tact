struct NestedDefault {
    foo: Int = 1;
    bar: Bool = true;
}

struct Top {
    nest: NestedDefault = NestedDefault{};
    s: String = "hello";
}

contract NestedDefaults {
    val: Top;

    init() {
        self.val = Top{};
    }
}