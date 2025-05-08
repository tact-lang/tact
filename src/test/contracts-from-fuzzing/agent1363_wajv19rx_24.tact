struct MixedOptDef {
    foo: Int = 5;
    bar: String? = null;
    baz: Bool = true;
}

contract OptDefaultPersist {
    s: MixedOptDef;

    init() {
        self.s = MixedOptDef{
            foo: 123,
            bar: null,
            baz: false,
        };
    }
}