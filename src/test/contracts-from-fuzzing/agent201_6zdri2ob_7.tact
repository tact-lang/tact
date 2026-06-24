struct Inner {
    p: Bool;
    q: String?;
}

struct Outer {
    s1: Int;
    s2: Inner;
    s3: Inner?;
}

contract MixedNestedOptionals {
    data: Outer;

    init() {
        self.data = Outer{
            s1: 1,
            s2: Inner{ p: true, q: null },
            s3: null
        };
    }
}
