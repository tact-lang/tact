struct Innermost {
    a: Int;
}

struct Inner {
    m: Innermost;
    b: Bool;
}

struct OuterMost {
    inner: Inner;
    s: String;
}

contract NestedStructs {
    data: OuterMost = OuterMost{
        inner: Inner{
            m: Innermost{a:5},
            b:true
        },
        s:"hello"
    };
    receive() {
        let _ = self.data.inner.m.a;
    }
}