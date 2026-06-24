struct Inner {
    flag: Bool;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract TestContract {
    nested: Outer = Outer{
        middle: Middle{
            inner: Inner{
                flag: true,
            }
        }
    };

    init() {
        self.nested = Outer{
            middle: Middle{
                inner: Inner{
                    flag: false,
                }
            }
        };
    }

    receive() {
        let flagVal = self.nested.middle.inner.flag;
    }
}