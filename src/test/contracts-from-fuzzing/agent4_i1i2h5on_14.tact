// Intentionally testing empty nested struct reference
struct EmptyInner { x: Int; }

struct Outer {
    inner: EmptyInner?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: null
        };
    }
}
