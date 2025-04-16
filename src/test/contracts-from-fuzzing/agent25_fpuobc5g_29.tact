// multiple nested structs with mix of primitives and optionals
struct A { a: Int; b: B; }
struct B { b: Bool; c: C; }
struct C { c: String?; }

contract Test {
    field: A;
    init() {
        self.field = A{
            a: 1,
            b: B{
                b: true,
                c: C{ c: null }
            }
        };
    }
}