struct InnerMost {
    a: Int;
    b: String;
}
struct Inner {
    innerMost: InnerMost;
}
struct Outer {
    inner: Inner;
}
contract DeepAssign {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                innerMost: InnerMost{
                    a: 5,
                    b: "Hello"
                }
            }
        };
    }
}