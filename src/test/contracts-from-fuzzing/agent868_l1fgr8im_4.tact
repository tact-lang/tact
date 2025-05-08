struct InnerMost {
    x: Int as uint8;
}

struct Inner {
    im: InnerMost;
    b: Bool;
}

struct Middle {
    a: Int as uint32;
    inner: Inner;
}

struct Outer {
    m: Middle;
}

contract TestContract {
    o: Outer = Outer{
        m: Middle{
            a: 99,
            inner: Inner{
                im: InnerMost{ x: 1 },
                b: true
            }
        }
    };

    receive() {
        // dummy
    }
}