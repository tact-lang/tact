// Nested optional of struct with optional primitive fields
struct Inner {
    x: Int?;
    y: Bool?;
}

struct Outer {
    inner: Inner?;
}

contract OptNestedStruct {
    d: Outer?;
    init() {
        self.d = null;
    }
}