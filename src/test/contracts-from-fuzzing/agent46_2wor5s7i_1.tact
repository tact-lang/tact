struct DeepNested {
    val1: Int;
    val2: Nested;
}

struct Nested {
    innerVal: InnerMost;
}

struct InnerMost {
    z: Int?;
    w: String;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            val1: 1,
            val2: Nested{
                innerVal: InnerMost{
                    z: null,
                    w: "test"
                }
            }
        };
    }
}
