struct A { a: Int; }
struct B { b: A; }
struct C { c: B; }
struct D { d: C; }

contract Test {
    data: D;
    
    init() {
        self.data = D{ d: C{ c: B{ b: A{ a: 123 } } } };
    }
}