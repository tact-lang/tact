contract NestedOptionalContract {
    datum: Outer?;
    init() {
        self.datum = null;
    }
}

struct Outer {
    inner: Inner?;
}

struct Inner {
    val: Int;
}