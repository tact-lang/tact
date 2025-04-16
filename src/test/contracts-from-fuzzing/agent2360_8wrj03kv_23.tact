// Nested optional struct mixing explicit null and subfields
struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner?;
}

contract MixNull {
    d: Outer;
    init() {
        self.d = Outer{ inner: null };
    }
}