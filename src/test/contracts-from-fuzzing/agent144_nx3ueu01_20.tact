struct Outer {
    num: Int;
    inner: Inner;
}

struct Inner {
    flag: Bool;
    s: SubInner;
}

struct SubInner {
    val: Int?;
}

contract DeepComplex {
    v: Outer;

    init() {
        self.v = Outer{
            num: 1,
            inner: Inner{
                flag: false,
                s: SubInner{val: null}
            }
        };
    }
}
