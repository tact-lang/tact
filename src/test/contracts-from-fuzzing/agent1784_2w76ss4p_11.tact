struct DefaultsNested {
    inner: InnerDef;
}

struct InnerDef {
    num: Int = 42;
    okay: Bool = true;
}

contract NestedDefaults {
    val: DefaultsNested;

    init() {
        self.val = DefaultsNested{
            inner: InnerDef{}
        };
    }
}