struct InnerOpt {
    a: Int?;
}

struct OuterOpt {
    inner: InnerOpt;
}

contract TestOptionalNested {
    receive() {
        let o: OuterOpt = OuterOpt {
            inner: InnerOpt { a: null }
        };
        o.inner.a;
    }
}
