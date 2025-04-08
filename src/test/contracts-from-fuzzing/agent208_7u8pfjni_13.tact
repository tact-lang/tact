struct Composed {
    nested: NestedDefaults;
    opt: WithOptionalDefaults;
}

struct NestedDefaults {
    x: Int = 1;
    y: Bool = true;
}

struct WithOptionalDefaults {
    a: Int?;
    b: Bool? = null;
    c: Bool = false;
}

contract Test14 {
    big: Composed;

    init() {
        self.big = Composed{
            nested: NestedDefaults{},
            opt: WithOptionalDefaults{
                a: null,
                b: null,
                c: false,
            },
        };
    }
}