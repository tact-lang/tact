struct InnerMost {
    val1: Int;
    val2: Bool?
}

struct Inner {
    nested1: InnerMost;
    nested2: InnerMost?;
}

contract DeepNested {
    sfield: Inner;

    init() {
        self.sfield = Inner{
            nested1: InnerMost{
                val1: 10,
                val2: true,
            },
            nested2: InnerMost{
                val1: 20,
                val2: null,
            }
        };
    }
}