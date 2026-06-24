struct InnerOpt {
    a: Int;
}

struct OuterOpt {
    inner: InnerOpt?;
    count: Int;
}

contract TestOptionalNested {
    receive() {
        let outer: OuterOpt = OuterOpt{
            inner: InnerOpt{ a: 42 },
            count: 7
        };
        let _ = outer.count;
        if (outer.inner != null) {
            let inner: InnerOpt = outer.inner!!;
            let _ = inner.a;
        }
    }
}
