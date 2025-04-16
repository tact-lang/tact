struct NestedBool {
    i: Int;
    b1: Bool;
    inner: InnerBool;
}

struct InnerBool {
    b2: Bool;
    b3: Bool;
}

contract TestNestedBool {
    f: NestedBool;

    init() {
        self.f = NestedBool{
            i: 5,
            b1: true,
            inner: InnerBool{
                b2: false,
                b3: true
            }
        };
    }
}
