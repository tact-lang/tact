struct NestedDefaults {
    a: Int = 1;
    b: InnerDefaults;
}

struct InnerDefaults {
    c: Int = 2;
    d: String = "hello";
}

contract NestedDefaultsContract {
    s: NestedDefaults;

    init() {
        self.s = NestedDefaults{
            b: InnerDefaults{}
        };
    }
}