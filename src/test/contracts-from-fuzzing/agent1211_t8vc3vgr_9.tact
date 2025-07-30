struct BoolDefaults {
    x: Bool = false;
    y: Bool = true;
    z: Bool;
}

contract DefaultsTest {
    val: BoolDefaults;
    init() {
        self.val = BoolDefaults{
            z: true,
        };
    }
}