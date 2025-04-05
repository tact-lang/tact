struct InnerOpt { a: Int?; }
struct OuterOpt { inner: InnerOpt; }

contract TestOptionalNested {
    receive() {
        let o: OuterOpt = OuterOpt { inner: InnerOpt { a: null } };
        if (o.inner.a == null) {
            dump(999);
        } else {
            dump(o.inner.a);
        }
    }
}
