struct NestedDefaults {
    inner: InnerWithDefaults;
    val: Int = 5;
}

struct InnerWithDefaults {
    flag: Bool = true;
    text: String = "abc";
}

contract NestedDefaultsTest {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{
            inner: InnerWithDefaults{},
        };
    }
}
