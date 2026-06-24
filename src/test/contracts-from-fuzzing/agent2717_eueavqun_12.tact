contract NestedLiterals {
    data: Outer;

    init() {
        self.data = Outer{
            a: 1,
            inner: Inner{
                b: 2,
                deep: Deep{
                    c:true,
                    s:"x"
                }
            }
        };
    }
}

struct Outer {
    a: Int;
    inner: Inner;
}

struct Inner {
    b: Int;
    deep: Deep;
}

struct Deep {
    c: Bool;
    s: String;
}