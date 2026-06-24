struct OptionalsInside {
    n1: Int?;
    n2: Bool?;
    nested: NestedOptional;
}

struct NestedOptional {
    x: Int?;
}

contract TestComplexOptional {
    s: OptionalsInside;

    init() {
        self.s = OptionalsInside{
            n1: null,
            n2: null,
            nested: NestedOptional{ x: null },
        };
    }
}