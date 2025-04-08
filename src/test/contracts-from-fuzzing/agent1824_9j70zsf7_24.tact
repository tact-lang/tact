// Nested struct chain with optional leaf
struct InnerMost {
    val: Int?;
}
struct Inner {
    leaf: InnerMost;
}
struct Mid {
    middle: Inner;
}
struct Outer {
    root: Mid;
}
contract OptionalLeaf {
    node: Outer;
    init() {
        self.node = Outer{
            root: Mid{
                middle: Inner{
                    leaf: InnerMost{ val: null }
                }
            }
        };
    }
}
