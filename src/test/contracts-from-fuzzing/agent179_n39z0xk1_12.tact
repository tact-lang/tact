struct OuterMost {
    s1: String;
    nested: InnerMost;
}

struct InnerMost {
    level: Int;
    name: String;
}

contract MixedOrder {
    data: OuterMost;
    init() {
        self.data = OuterMost{
            s1: "top",
            nested: InnerMost{ level: 3, name: "inner" }
        };
    }
}