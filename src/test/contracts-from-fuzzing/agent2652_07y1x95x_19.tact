struct DeepDefaults {
    a: Int = 1;
    b: Bool = false;
    s: String = "abc";
}

struct Wrapper {
    nested: DeepDefaults;
}

contract NestedDefaultsTest {
    data: Wrapper;

    init() {
        self.data = Wrapper{ nested: DeepDefaults{} };
    }
}