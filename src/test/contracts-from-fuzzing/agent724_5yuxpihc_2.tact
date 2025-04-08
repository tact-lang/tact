struct Nested {
    inner: Int;
    opt: String?;
    flag: Bool;
}

struct Outer {
    n1: Nested;
    n2: Nested;
    s: String;
}

contract DeepStructTest {
    storage: Outer;

    init() {
        self.storage = Outer{
            n1: Nested{inner: 1, opt: null, flag: true},
            n2: Nested{inner: 2, opt: "x", flag: false},
            s: "ok"
        };
    }
}