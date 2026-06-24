struct Inner {
    x: Int = 42;
    y: Bool = true;
}

struct Outer {
    inner: Inner;
    s: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{},
            s: "hello"
        };
    }
}