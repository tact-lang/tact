struct OptionalAndDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

struct WrapOptDef {
    inner: OptionalAndDefaults;
}

contract OptDefaultNested {
    w: WrapOptDef;

    init() {
        self.w = WrapOptDef{
            inner: OptionalAndDefaults{}
        };
    }
}