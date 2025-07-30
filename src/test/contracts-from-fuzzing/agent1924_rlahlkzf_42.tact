struct NestedStringOpts {
    a: Inner?;
}

struct Inner {
    s: String?;
}

contract TestContract {
    data: NestedStringOpts;

    init() {
        self.data = NestedStringOpts{
            a: Inner{ s: null }
        };
    }
}