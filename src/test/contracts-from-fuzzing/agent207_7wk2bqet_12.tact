struct Outer {
    n: Int;
    inner: Inner;
}

struct Inner {
    m: Int;
    s: String;
}

contract Test12 {
    f: Outer;
    init() {
        self.f = Outer{
            n: 10,
            inner: Inner{
                m: 20,
                s: "hi"
            }
        };
    }
}