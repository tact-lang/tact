struct A { x: Int; y: String?; }
struct B { z: Int; a: A; }

contract NestedOptionalField {
    inner: B;

    init() {
        self.inner = B{
            z: 99,
            a: A{ x: 10, y: null }
        };
    }
}