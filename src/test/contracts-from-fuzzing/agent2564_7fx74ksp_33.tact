struct NestedDefaults {
    a: Int = 1;
    b: Bool = false;
}

struct Wrapper {
    n: NestedDefaults;
}

contract NestedDefaultsTest {
    data: Wrapper;

    init() {
        self.data = Wrapper{ n: NestedDefaults{} };
    }
}