struct NestedDefaults {
    s1: SubWithDefault;
    s2: SubWithDefault;
}

struct SubWithDefault {
    a: Int = 5;
    b: String = "abc";
}

contract MultipleDefaults {
    nd: NestedDefaults;

    init() {
        self.nd = NestedDefaults{
            s1: SubWithDefault{},
            s2: SubWithDefault{},
        };
    }
}
