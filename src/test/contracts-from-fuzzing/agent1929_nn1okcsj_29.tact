struct NestedDefaultsMix {
    i: Int = 9;
    nested: InnerDefault;
}

struct InnerDefault {
    x: Int = 5;
    y: Bool = true;
}

contract DefaultsMix {
    s: NestedDefaultsMix;
    init() {
        self.s = NestedDefaultsMix{
            nested: InnerDefault{}
        };
    }
}