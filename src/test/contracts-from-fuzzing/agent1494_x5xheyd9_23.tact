struct NestedAndDefaults {
    inner: InnerDef;
    number: Int = 7;
}

struct InnerDef {
    text: String = "abc";
    flag: Bool = false;
}

contract DeepDefaultsTest {
    data: NestedAndDefaults;

    init() {
        self.data = NestedAndDefaults{
            inner: InnerDef{},
        };
    }
}
