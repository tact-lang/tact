struct NestedDefaults {
    a: Int = 1;
    b: Bool = true;
}

struct UseDefaultNest {
    inner: NestedDefaults;
    c: String = "hi";
}

contract DefaultsNestedTest {
    d: UseDefaultNest;

    init() {
        self.d = UseDefaultNest{
            inner: NestedDefaults{},
            c: "hi"
        };
    }
}