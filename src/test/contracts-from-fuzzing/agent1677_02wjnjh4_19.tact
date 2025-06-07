struct BoolDefaults {
    b1: Bool = true;
    b2: Bool = false;
}

contract BoolDefaultsTest {
    val: BoolDefaults = BoolDefaults{b1:true, b2:false};

    init() {
        self.val.b1 = false;
    }
}
