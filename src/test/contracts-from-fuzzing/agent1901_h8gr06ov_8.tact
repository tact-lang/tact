struct Nested {
    x: Int;
    y: Bool;
}

struct Top {
    id: Int = 1;
    inner: Nested;
}

contract CompositeInit {
    s: Top;

    init() {
        self.s = Top{
            id: 42,
            inner: Nested{
                x: 11,
                y: true
            }
        };
    }
}