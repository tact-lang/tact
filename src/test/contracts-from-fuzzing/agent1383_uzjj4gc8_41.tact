struct Nested {
    inner1: Inner;
    inner2: Inner;
}

struct Inner {
    a: Int;
    b: String?;
}

contract DoubleNested {
    n: Nested;
    init() {
        self.n = Nested{
            inner1: Inner{a:1,b:null},
            inner2: Inner{a:2,b:"abc"}
        };
    }
}