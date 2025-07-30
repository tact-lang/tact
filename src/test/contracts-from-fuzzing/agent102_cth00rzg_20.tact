struct NestedDefaults {
    a: Int = 1;
    b: InnerDefaults;
}

struct InnerDefaults {
    x: Int = 2;
    y: Bool = true;
}

contract NestedStructDefaults {
    val: NestedDefaults;

    init() {
        self.val = NestedDefaults{
            b: InnerDefaults{}
        };
    }
}