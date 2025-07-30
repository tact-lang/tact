struct ManyNestedDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
}

struct WrapDefaults {
    nested: ManyNestedDefaults;
}

contract WrapManyDefaults {
    w: WrapDefaults;

    init() {
        self.w = WrapDefaults{
            nested: ManyNestedDefaults{},
        };
    }
}