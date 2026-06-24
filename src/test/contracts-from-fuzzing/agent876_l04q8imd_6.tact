struct LargeNest1 { a: Int; }
struct LargeNest2 { inner: LargeNest1; b: Int; }
struct LargeNest3 { inner: LargeNest2; c: Int; }
struct LargeNest4 { inner: LargeNest3; d: Int; }
struct LargeNest5 { inner: LargeNest4; e: Int; }

contract BigNestingContract {
    info: LargeNest5;

    init() {
        self.info = LargeNest5{
            inner: LargeNest4{
                inner: LargeNest3{
                    inner: LargeNest2{
                        inner: LargeNest1{a:1},
                        b:2
                    },
                    c:3
                },
                d:4
            },
            e:5
        };
    }

    receive() {
        dump(self.info.inner.inner.inner.inner.a);
    }
}