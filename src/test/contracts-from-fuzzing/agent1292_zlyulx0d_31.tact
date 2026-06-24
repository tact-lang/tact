struct InnerMost {
    a: Int?;
}

struct Inner {
    nested: InnerMost?;
}

struct OuterMost {
    innerVal: Inner;
}

contract DeepNullable {
    rec: OuterMost;

    init() {
        self.rec = OuterMost{
            innerVal: Inner{
                nested: null,
            }
        };
    }
}