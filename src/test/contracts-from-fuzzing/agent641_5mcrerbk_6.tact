struct NestedWithOptionals {
    s: String?;
    inner: Inner?;
}

struct Inner {
    n: Int;
    f: Bool?;
}

contract TestContract {
    data: NestedWithOptionals;

    init() {
        self.data = NestedWithOptionals{
            s: null,
            inner: Inner{
                n: 123,
                f: false
            }
        };
    }
}