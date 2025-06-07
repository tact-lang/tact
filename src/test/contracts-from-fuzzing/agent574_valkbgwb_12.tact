struct InnerInner {
    foo: Int?;
    bar: String?;
}

struct Inner {
    a: Int;
    b: Bool?;
    nested: InnerInner?;
}

struct Outer {
    x: Int?;
    y: Bool;
    z: String?;
    inner: Inner;
}

contract MixNestedOptionals {
    data: Outer;

    init() {
        self.data = Outer{
            x: null,
            y: true,
            z: null,
            inner: Inner{
                a: 1,
                b: null,
                nested: null
            }
        };
    }

    receive() {
        if (self.data.inner.nested != null && self.data.inner.nested!!.foo != null) {
            dump(self.data.inner.nested!!.foo!!);
        }
    }
}