struct ADefaults {
    x: Int = 1;
    y: Int = 2;
}

struct BDefaults {
    ref: ADefaults;
    z: Int = 3;
}

contract NestedDefaults {
    val: BDefaults;

    init() {
        self.val = BDefaults{
            ref: ADefaults{},
            z: 33
        };
    }
}