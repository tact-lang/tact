struct A { x: Int? = null }
struct B { a: A = A{} }
struct C { b: B = B{} }

contract MultiDefaults {
    val: C = C{};

    init() {
        self.val = C{ b: B{ a: A{ x: 7 } } };
    }
}