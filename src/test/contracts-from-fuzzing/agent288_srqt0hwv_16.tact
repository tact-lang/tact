struct InnerLevel {
    val1: Int;
    optVal: Int?;
}

struct OuterLevel {
    fieldA: Int;
    nested: InnerLevel;
}

contract TestContract {
    s: OuterLevel;

    init() {
        self.s = OuterLevel{
            fieldA: 42,
            nested: InnerLevel{
                val1: 7,
                optVal: null
            }
        };
    }
}