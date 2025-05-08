struct Inner {
    s: String;
}

struct Middle {
    i: Int;
    inner: Inner;
}

struct Outer {
    b: Bool;
    middle: Middle;
}

contract TripleNest {
    content: Outer;

    init() {
        self.content = Outer{
            b: true,
            middle: Middle{
                i: 123,
                inner: Inner{
                    s: "deep"
                }
            }
        };
    }
}