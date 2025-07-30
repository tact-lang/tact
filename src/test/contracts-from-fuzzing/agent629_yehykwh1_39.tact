struct NestedOpts {
    opt1: Inner?;
}

struct Inner {
    opt2: Int?;
}

contract Test {
    val: NestedOpts;
    init() {
        self.val = NestedOpts{ opt1: Inner{ opt2: null } };
    }
}
