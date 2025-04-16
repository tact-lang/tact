struct ComplexNest {
    level1: Int;
    level2: InnerLevel;
}

struct InnerLevel {
    level3: InnerMostLevel;
}

struct InnerMostLevel {
    val1: Int;
    val2: Bool;
    val3: String;
}

contract ComplexNestedContract {
    data: ComplexNest;

    init() {
        self.data = ComplexNest{
            level1: 10,
            level2: InnerLevel{
                level3: InnerMostLevel{
                    val1: 42,
                    val2: false,
                    val3: "hi",
                },
            },
        };
    }
}