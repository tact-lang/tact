struct SInner { foo: Int; bar: Bool; }

struct SImpliedDefaults {
    val: Int = 99;
    optVal: Int?;
    nested: SInner;
}

contract DefaultsTest {
    s: SImpliedDefaults;

    init() {
        self.s = SImpliedDefaults{
            nested: SInner{ foo: 1, bar: true },
        };
    }
}