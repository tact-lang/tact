struct InnerMost {
    val1: Int;
    val2: Bool;
}

struct Middle {
    nested: InnerMost;
    optional: Bool?;
}

struct Outer {
    m: Middle;
}

contract DeepNesting {
    data: Outer;

    init() {
        self.data = Outer{
            m: Middle{
                nested: InnerMost{ val1: 10, val2: true },
                optional: null
            }
        };
    }
}