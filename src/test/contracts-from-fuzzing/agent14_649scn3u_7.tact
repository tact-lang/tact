struct NestedDefaults {
    inner: InnerDff;
    flag: Bool;
}

struct InnerDff {
    val: Int = 123;
    opt: String? = null;
}

contract DefaultNested {
    field: NestedDefaults;

    init() {
        self.field = NestedDefaults{
            inner: InnerDff{},
            flag: true,
        };
    }
}