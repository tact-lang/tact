// deeply nested mixture of optional and defaulted complex struct
struct OuterMost {
    inner: Outer?;
}

struct Outer {
    inner2: Middle?;
}

struct Middle {
    inner3: Inner?;
}

struct Inner {
    x: Int = 9;
    y: Bool = true;
}

contract TestDeepOptsDefaults {
    s: OuterMost;
    init() {
        self.s = OuterMost{
            inner: Outer{
                inner2: Middle{
                    inner3: Inner{}
                }
            }
        };
    }
}
