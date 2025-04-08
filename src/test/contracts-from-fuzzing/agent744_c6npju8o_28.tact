struct InnerMost { a: Int }
struct Inner { inmost: InnerMost }
struct Middle { inner: Inner }
struct Outer {
    middle: Middle;
    optInner: Inner?;
}

contract ComboDeepOpt {
    val: Outer;

    init() {
        self.val = Outer{
            middle: Middle{
                inner: Inner{
                    inmost: InnerMost{ a: 888 }
                }
            },
            optInner: null,
        };
    }
}