contract TestContract {
    nested: NestedWrap;

    init() {
        self.nested = NestedWrap{
            val: DeepNest{
                innermost: ReallyDeep{
                    foo: 100
                }
            }
        };
    }
}

struct NestedWrap {
    val: DeepNest;
}

struct DeepNest {
    innermost: ReallyDeep;
}

struct ReallyDeep {
    foo: Int;
}
