struct Nested {
    p: Int;
    q: Bool;
}

struct Outer {
    x: Int;
    inner: Nested;
    y: Bool;
}

contract DeepStructStorage {
    d: Outer;

    init() {
        self.d = Outer{
            x: 10,
            inner: Nested{ p: 1, q: false },
            y: true
        };
    }
}