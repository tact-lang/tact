struct Inner {
    a: Int = 7;
    b: String = "hello";
}

struct Outer {
    inner: Inner;
    c: Bool = false;
}

contract DeepTest {
    storage: Outer;

    init() {
        self.storage = Outer{
            inner: Inner{
                a: 7,
                b: "hello",
            },
            c: false
        };
    }
}