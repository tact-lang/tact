struct OptionalNest {
    o1: Int?;
    o2: Bool?;
    o3: NestedOptional?;
}

struct NestedOptional {
    x: Int;
    y: String?;
}

contract OptionalNestTest {
    storage: OptionalNest;

    init() {
        self.storage = OptionalNest{
            o1: null,
            o2: true,
            o3: NestedOptional{
                x: 5,
                y: null,
            },
        };
    }
}
