struct Inner {
    f: Int;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract InitPartial {
    st: Outer;

    init() {
        self.st = Outer{
            middle: Middle{
                inner: Inner{ f:7 }
            }
        };
    }
}