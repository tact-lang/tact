struct StrNest {
    a: Int;
    inner: Inner;
}

struct Inner {
    b: Int;
    deeper: Deeper;
}

struct Deeper {
    c: Int;
}

contract TestDeepStructs {
    val: StrNest;
    init() {
        self.val = StrNest{
            a: 1,
            inner: Inner{
                b: 2,
                deeper: Deeper{ c: 3 }
            }
        };
    }
}