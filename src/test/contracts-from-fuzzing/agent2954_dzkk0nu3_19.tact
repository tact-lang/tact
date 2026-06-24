struct NestedDefaults {
    foo: Int = 5;
    bar: Inner;
}

struct Inner {
    text: String = "hi";
    flag: Bool = true;
}

contract NestedDefaultsTest {
    data: NestedDefaults;
    init() {
        self.data = NestedDefaults{ bar: Inner{} };
    }
}
