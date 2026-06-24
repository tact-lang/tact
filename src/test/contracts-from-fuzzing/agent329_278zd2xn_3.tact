struct DeepNested {
    val1: Int;
    val2: Bool;
}

struct Outer {
    nested: DeepNested;
    optVal: Int?;
}

contract TestContract {
    complexField: Outer;

    init() {
        self.complexField = Outer{
            nested: DeepNested{ val1: 1, val2: false },
            optVal: null,
        };
    }
}