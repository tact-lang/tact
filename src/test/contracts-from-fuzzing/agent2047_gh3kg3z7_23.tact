struct NestedDefaults {
    foo: Int = 10;
    bar: Bool = false;
}

struct Outer {
    nest: NestedDefaults = NestedDefaults{};
    str: String = "hello";
}

contract StructNestedDefaults {
    data: Outer;

    init() {
        self.data = Outer{};
    }
}