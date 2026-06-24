struct ManyDefaults {
    x: Int = 1;
    y: Bool = false;
    z: String = "hey";
    t: Slice? = null;
}

contract DefaultTest {
    val: ManyDefaults;
    init() {
        self.val = ManyDefaults{};
    }
}