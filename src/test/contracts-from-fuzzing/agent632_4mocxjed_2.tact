struct DeepNested {
    innermost: Int?;
}

struct MidNested {
    deep: DeepNested;
}

struct OuterMost {
    mid: MidNested;
}

contract TestContract {
    tree: OuterMost;

    init() {
        self.tree = OuterMost{mid: MidNested{deep: DeepNested{innermost: null}}};
    }
}