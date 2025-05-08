struct ManyNestedOptionals {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    nested: Nested?;
}

struct Nested {
    n1: Int?;
    n2: Bool?;
    n3: String?;
}

contract ManyNestedOptionalsTest {
    state: ManyNestedOptionals;

    init() {
        self.state = ManyNestedOptionals{
            o1: null,
            o2: true,
            o3: "ok",
            nested: Nested{
                n1: null,
                n2: false,
                n3: null
            }
        };
    }
}