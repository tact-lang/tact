struct DeepNestOption {
    inn: Middle?;
}

struct Middle {
    val: Leaf;
}

struct Leaf {
    x: Int;
}

contract NestedOptField {
    f: DeepNestOption;

    init() {
        self.f = DeepNestOption{inn: null};
    }
}