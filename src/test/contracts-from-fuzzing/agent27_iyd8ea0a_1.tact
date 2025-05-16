struct NestedDeep {
    level1: Int;
    level2: InnerLevel;
}

struct InnerLevel {
    a: Int;
    b: Int?;
    c: InnerMost;
}

struct InnerMost {
    val1: Bool;
    val2: String;
}

contract TestContract {
    data: NestedDeep;

    init() {
        self.data = NestedDeep{
            level1: 1,
            level2: InnerLevel{
                a: 2,
                b: null,
                c: InnerMost{
                    val1: true,
                    val2: "deep dive"
                }
            }
        };
    }
}