struct Outer {
    inner: Inner;
}

struct Inner {
    nestedOpt: Nested?;
}

struct Nested {
    str: String;
    val: Int;
}

contract OptionalNested {
    s: Outer;
    init() {
        self.s = Outer{
            inner: Inner{
                nestedOpt: Nested{ str:"abc", val:42 }
            }
        };
    }
}
