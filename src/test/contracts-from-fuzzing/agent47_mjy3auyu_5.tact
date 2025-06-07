struct NestedOptionals {
    i: Int?;
    s: String?;
    inner: Inner?;
}

struct Inner {
    flag: Bool;
    txt: String?;
}

contract OptionalNest {
    data: NestedOptionals;
    init() {
        self.data = NestedOptionals{
            i: null,
            s: null,
            inner: null
        };
    }
}