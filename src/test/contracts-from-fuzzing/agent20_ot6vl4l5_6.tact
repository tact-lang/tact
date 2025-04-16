struct Inner {
    foo: Int;
    bar: Bool;
}

struct Middle {
    inner: Inner;
    optInner: Inner?;
}

struct Outer {
    middle: Middle;
    optMiddle: Middle?;
}

contract RecursiveLayers {
    val: Outer;

    init() {
        self.val = Outer{
            middle: Middle{ inner: Inner{ foo:1, bar:false }, optInner:null },
            optMiddle: null
        };
    }
}