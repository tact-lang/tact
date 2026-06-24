struct Outer {
    innerOption: Inner?;
}

struct Inner {
    maybeVal: Int?;
}

contract NestedOptionalFields {
    p: Outer;

    init() {
        self.p = Outer{
            innerOption: Inner{ maybeVal: null }
        };
    }
}