// Large nested optional-in-struct in nested-persistent field
struct InnerMost {
    data: Int?;
}

struct Inner {
    innerField: InnerMost?;
    value: Bool;
}

contract TestContract {
    nestedOpt: Inner?;

    init() {
        self.nestedOpt = null;
    }
}
