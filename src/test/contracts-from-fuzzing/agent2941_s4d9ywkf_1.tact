struct DeepNest {
    level1: NestedOptional;
    flag: Bool;
}

struct NestedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract DeepNestTest {
    field: DeepNest;

    init() {
        self.field = DeepNest{
            level1: NestedOptional{
                a: 1,
                b: false,
                c: "deep",
            },
            flag: true,
        };
    }
}