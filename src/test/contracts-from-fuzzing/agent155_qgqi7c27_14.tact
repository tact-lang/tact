struct A { x: Int; }
struct B { y: Int; }
struct C { a: A; b: B; }
contract StructOfStructs {
    c: C;
    init() {
        self.c = C{ a: A{ x: 1 }, b: B{ y: 2 } };
    }
}