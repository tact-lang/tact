struct Inner {
    deep: Int;
    optional: Int?;
}

struct Middle {
    inner: Inner;
    active: Bool?;
}

struct Outer {
    middle: Middle;
    tag: Int;
}

contract DeepNestedStruct {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: Inner{ deep: 1, optional: null },
                active: null
            },
            tag: 0
        };
    }

    receive() {
        if (self.data.middle.inner.optional != null) {
            self.data.middle.inner.optional = self.data.middle.inner.optional!! + 1;
        } else {
            self.data.middle.inner.optional = 42;
        }
    }
}