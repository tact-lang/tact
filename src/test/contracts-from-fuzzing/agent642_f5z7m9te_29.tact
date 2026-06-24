// Optional nested struct assigned partially null inner
struct Inner {
    foo: Int;
    bar: String?;
}

struct Outer {
    nested: Inner?;
}

contract PartialNullAssign {
    store: Outer;

    init() {
        self.store = Outer{ nested: null };
    }
}