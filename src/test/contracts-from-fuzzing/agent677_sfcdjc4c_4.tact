struct InnerMost {
    y: Int = 1;
}

struct Inner {
    x: InnerMost;
    flag: Bool = true;
}

struct Outer {
    inner: Inner;
    s: String = "s";
}

contract DeepNestedStructTest {
    o: Outer;

    init() {
        self.o = Outer{
            inner: Inner{
                x: InnerMost{ y: 42 },
                flag: false,
            },
            s: "hello",
        };
    }

    receive() {
        let _ = self.o.inner.x.y + 1;
    }
}