struct NestedDefaults {
    s: InnerDefaults;
}

struct InnerDefaults {
    x: Int = 99;
    y: String = "hi";
}

contract DefaultsNestedTest {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{ s: InnerDefaults{} };
    }
}