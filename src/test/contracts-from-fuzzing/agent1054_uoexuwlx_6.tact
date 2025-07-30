contract TestContract {
    optNested: Outer?;

    init() {
        self.optNested = Outer{
            inner: Inner{
                val: 42,
                maybeDeep: null
            }
        };
    }
}

struct Outer {
    inner: Inner;
}

struct Inner {
    val: Int;
    maybeDeep: Deep?;
}

struct Deep {
    label: String;
}