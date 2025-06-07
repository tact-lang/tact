struct Nested {
    a: Int;
    b: Bool?;
    c: Inner;
}

struct Inner {
    d: Int;
    e: String?;
}

contract TestContract {
    storage: Nested;
    init() {
        self.storage = Nested{
            a: 2,
            b: null,
            c: Inner{ d: 3, e: null }
        };
    }
}