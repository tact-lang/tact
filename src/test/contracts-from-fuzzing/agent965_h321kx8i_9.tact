struct NestedOpt {
    f: Inner?;
}

struct Inner {
    a: Int?;
    b: Bool?;
}

contract TestNestedOpt {
    val: NestedOpt;

    init() {
        self.val = NestedOpt{
            f: Inner{
                a: null,
                b: null,
            }
        };
    }
}