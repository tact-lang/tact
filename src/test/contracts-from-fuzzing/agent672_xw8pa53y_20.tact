struct Inner {
    num: Int;
    flag: Bool;
}

struct StructDefaults {
    inner: Inner = Inner{ num: 1, flag: false };
    text: String = "def";
}

contract NestedDefaultsTest {
    data: StructDefaults;
    init() {
        self.data = StructDefaults{};
    }
}
