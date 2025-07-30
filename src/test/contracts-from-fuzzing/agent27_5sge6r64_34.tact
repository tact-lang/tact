// test deeply nested optionals inside fields, legal (no nested optionals types)
struct D {
    x: Int?;
    y: Bool?;
}

struct C {
    d1: D?;
    d2: D?;
}

struct B {
    c1: C?;
    c2: C?;
}

contract TestContract {
    b: B?;
    init() {
        self.b = null;
    }
}
