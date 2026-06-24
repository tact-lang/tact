struct Inner {
    foo: Int;
    bar: Bool;
}

struct NestedDefaults {
    k: Inner = Inner{
        foo: 77,
        bar: true
    };
    s: String = "ok";
}

contract NestedDefaultsTest {
    f: NestedDefaults;

    init() {
        self.f = NestedDefaults{};
    }

    receive() {}
}