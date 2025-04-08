struct DeepNested {
    inner: InnerLevel;
}

struct InnerLevel {
    deeper: DeepestLevel?;
}

struct DeepestLevel {
    val: Int;
}

contract TestDeep {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            inner: InnerLevel{
                deeper: null
            }
        };
    }
}