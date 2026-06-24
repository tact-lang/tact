struct NestedDefaults {
    foo: Defaulted;
}

struct Defaulted {
    a: Int = 42;
    b: Bool = true;
    c: String = "hi";
}

contract NestedDefaultsTest {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{
            foo: Defaulted{}
        };
    }
}
