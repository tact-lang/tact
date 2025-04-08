struct NestedDefaults {
    inner1: Inner;
    inner2: Inner;
}

struct Inner {
    foo: Int = 5;
    bar: Bool = true;
}

contract DefaultsInside {
    val: NestedDefaults;

    init() {
        self.val = NestedDefaults{
            inner1: Inner{},
            inner2: Inner{ foo: 2, bar: false },
        };
    }
}