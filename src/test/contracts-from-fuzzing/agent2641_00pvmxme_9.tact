struct FewDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
}

contract DefaultsTest {
    val: FewDefaults;

    init() {
        self.val = FewDefaults{};
    }
}