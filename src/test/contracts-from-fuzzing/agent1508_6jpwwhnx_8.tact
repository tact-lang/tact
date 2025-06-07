struct Outer {
    a: Int;
    b: Bool;
    inner: Inner;
}

struct Inner {
    x: Int;
    y: Bool;
    nested: Nested;
}

struct Nested {
    p: Int;
    q: Bool;
}

contract TestContract {
    complexField: Outer;

    init() {
        self.complexField = Outer{
            a: 1,
            b: true,
            inner: Inner{
                x: 10,
                y: false,
                nested: Nested{
                    p: 100,
                    q: true
                }
            }
        };
    }
}