struct NestedWithOptional {
    innerOpt: Int?;
}

struct OuterWithDefaultOptional {
    nested: NestedWithOptional?; // optional struct itself
}

contract OptionalsInNested {
    f: OuterWithDefaultOptional;

    init() {
        self.f = OuterWithDefaultOptional{nested: null};
    }
}