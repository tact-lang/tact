struct Nested {
    deep: InnerLevel;
}

struct InnerLevel {
    deeper: InnerMost;
}

struct InnerMost {
    value: Int;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{
            deep: InnerLevel{
                deeper: InnerMost{
                    value: 999
                }
            }
        };
    }
}
