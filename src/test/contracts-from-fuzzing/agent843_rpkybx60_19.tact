struct DeepDefaults {
    a: Int = 1;
    b: Bool = false;
    c: Int = 2;
    d: Bool = true;
}

struct MiddleDefaults {
    inner: DeepDefaults;
    x: Int = 42;
}

contract NestedDefaults {
    val: MiddleDefaults;

    init() {
        self.val = MiddleDefaults{
            inner: DeepDefaults{ a: 10, b: true, c: 20, d: false },
            x: 77
        };
    }
}
