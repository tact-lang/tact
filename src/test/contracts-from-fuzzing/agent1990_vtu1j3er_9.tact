struct NestedOptionals {
    s: String?;
    inner: Inner?;
}

struct Inner {
    x: Int;
    y: Bool?;
}

contract LayeredOptionals {
    val: NestedOptionals;

    init() {
        self.val = NestedOptionals{
            s: null,
            inner: null
        };
    }
}
