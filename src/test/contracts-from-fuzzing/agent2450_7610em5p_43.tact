// An optional struct nested inside another non-optional struct
struct InnerOptional {
    x: Int?;
}

struct Outer {
    inner: InnerOptional?;
}

contract NestedOptWrap {
    store: Outer;
    init() {
        self.store = Outer{ inner: null };
    }
}
