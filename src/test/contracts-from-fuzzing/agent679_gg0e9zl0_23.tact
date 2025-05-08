// Nested many-level deeply optional chain
struct A { val: Int?; }
struct B { inner: A?; }
struct C { inner: B?; }
struct D { inner: C?; }
struct E { inner: D?; }

contract TestContract {
    data: E;
    init() {
        self.data = E { inner: null };
    }
}