struct DeepOptional {
    nested: NestedOpt?;
}
struct NestedOpt {
    foo: Int;
    bar: InnerMost?;
}
struct InnerMost {
    val: Bool;
}

contract TestContract {
    s: DeepOptional;
    init() {
        self.s = DeepOptional{
            nested: NestedOpt{
                foo: 123,
                bar: InnerMost{
                    val: true
                }
            }
        };
    }
}