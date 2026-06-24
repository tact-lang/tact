struct InnerOpt {
    opt: Int?;
}

struct OuterOpt {
    inner: InnerOpt;
}

contract TestOptionalNested {
    receive() {
        let out: OuterOpt = OuterOpt{
            inner: InnerOpt{ opt: 50 }
        };
        let val: Int = out.inner.opt!!; // non-null assertion
    }
}
