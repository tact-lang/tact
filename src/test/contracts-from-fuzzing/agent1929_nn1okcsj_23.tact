struct Outer {
    field: Inner;
}

struct Inner {
    innerField: Int?;
}

contract NullDeep {
    data: Outer;
    init() {
        self.data = Outer{
            field: Inner{innerField: null}
        };
    }
}