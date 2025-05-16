struct NestedWithDefaults {
    name: String = "default";
    optVal: Int?;
}

struct WrapNested {
    nested: NestedWithDefaults;
}

contract DefaultInNested {
    f: WrapNested;

    init() {
        self.f = WrapNested{
            nested: NestedWithDefaults{optVal: null}
        };
    }
}