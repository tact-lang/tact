// deeply nested optionals test (allowed only singly nested)

struct InnerMost {
    foo: Int?;
}

struct Mid {
    inner: InnerMost?; // optional wrapping struct with optional inside
}

struct Outer {
    mid: Mid?;  // optional wrapping struct with optional wrapping struct w/ optional
    x: Int;
}

contract Test11 {
    data: Outer;

    init() {
        self.data = Outer{
            mid: null,
            x: 7,
        };
    }
}