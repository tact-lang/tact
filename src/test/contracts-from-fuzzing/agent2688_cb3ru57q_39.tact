struct NestedDefaults {
    a: Int?;
    b: Int = 42;
    c: Bool?;
    d: Bool = false;
}

contract OptDefaultsMix {
    nd: NestedDefaults?;

    init() {
        self.nd = NestedDefaults{
            a: null,
            c: null
        };
    }
}