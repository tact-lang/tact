struct Outer {
    inner: InnerOpt?;
}

struct InnerOpt {
    value: Int?;
}

contract NullInitialization {
    field: Outer;

    init() {
        self.field = Outer{
            inner: null
        };
    }
}
