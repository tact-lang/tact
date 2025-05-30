struct A { x: Int?; }
struct B { a: A; }
struct C { b: B; }

contract TestDeep {
    c: C = C{ b: B{ a: A{ x: null } } };
}