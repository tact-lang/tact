struct InnerMost {
    z: Int?;
}

struct Inner {
    x: Int;
    nested: InnerMost;
}

contract DeepNest {
    val: Inner;

    init() {
        self.val = Inner{
            x: 1,
            nested: InnerMost{ z: null }
        };
    }
}
