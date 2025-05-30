struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

struct Outer {
    inner: Inner;
    s: String;
}

contract Test {
    outerField: Outer;

    init() {
        self.outerField = Outer{
            inner: Inner{
                a: 7,
                b: false,
                c: "abc"
            },
            s: "xyz"
        };
    }
}
