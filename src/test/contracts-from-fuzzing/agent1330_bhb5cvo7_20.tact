struct Outer {
    inner: Inner;
}

struct Inner {
    s1: String;
    s2: String;
    s3: String;
}

contract MultiInnerStr {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ s1: "x", s2: "y", s3: "z" }
        };
    }
}