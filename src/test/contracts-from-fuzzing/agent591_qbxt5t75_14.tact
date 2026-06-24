struct A { x: Int; y: Bool; }
struct B { a: A; }
struct C { b: B; }

contract ContractABC {
    c: C;
    init() {
        self.c = C{ b: B{ a: A{ x: 1, y: false } } };
    }
}