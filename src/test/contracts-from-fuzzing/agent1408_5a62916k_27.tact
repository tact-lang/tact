struct OptionalDefaultsNested {
    a: Int? = null;
    inner: InnerOptDefaults;
}

struct InnerOptDefaults {
    b: Int? = null;
    c: Bool = false;
}

contract TestContract {
    field: OptionalDefaultsNested;

    init() {
        self.field = OptionalDefaultsNested{
            a: null,
            inner: InnerOptDefaults{b:42,c:true},
        };
    }
}