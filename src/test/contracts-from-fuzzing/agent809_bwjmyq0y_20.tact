struct NestedDefaults {
    a: Int = 1;
    b: Inner = Inner{ c: true, d: null };
}

struct Inner {
    c: Bool;
    d: Int?;
}

contract NestedDefaultsContract {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{
            a: 2,
            b: Inner{ c: false, d: null }
        };
    }
}