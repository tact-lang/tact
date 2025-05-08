struct Container {
    first: Int;
    second: Inner;
}
struct Inner {
    inside1: String?;
    inside2: Bool?;
}
contract ComplexNestedOpt {
    c: Container;
    init() {
        self.c = Container{
            first: 42,
            second: Inner{
                inside1: null,
                inside2: null
            }
        };
    }
}