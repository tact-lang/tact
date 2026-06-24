struct OptionalDefaults {
    o1: Int? = null;
    o2: String? = null;
    o3: Bool? = null;
    o4: Cell? = null;
    o5: Slice? = null;
}

contract OptDefTest {
    val: OptionalDefaults;

    init() {
        self.val = OptionalDefaults{};
    }
}