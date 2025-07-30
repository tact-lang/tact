// Optional of nested struct with optional
struct Inner {
    v: Int?;
}

struct Outer {
    inner: Inner?;
}

contract NestedOptions {
    data: Outer?;
    init() {
        self.data = Outer{inner: Inner{v: null}};
    }
}