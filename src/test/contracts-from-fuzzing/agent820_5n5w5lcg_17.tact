struct NestedStructWithDefaults {
    x: Int;
    nest: InnerWithDefaults;
}

struct InnerWithDefaults {
    y: Bool = true;
    z: String = "default";
}

contract TestContract {
    s: NestedStructWithDefaults;
    init() {
        self.s = NestedStructWithDefaults{
            x: 10,
            nest: InnerWithDefaults{},
        };
    }
}