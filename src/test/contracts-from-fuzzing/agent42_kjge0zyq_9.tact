struct Inner {
    u: Int?;
    s: String;
    b: Bool?;
}

struct Outer {
    i: Inner;
    t: String?;
}

contract MixNulls {
    data: Outer;

    init() {
        self.data = Outer{
            i: Inner{ u: null, s: "hello", b: null },
            t: null
        };
    }
}