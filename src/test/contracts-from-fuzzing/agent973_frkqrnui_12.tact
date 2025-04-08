struct Nested1 { a: Int; }
struct Nested2 { a: Int; }
struct Nested3 { a: Int; }

contract MultiStructs {
    n1: Nested1;
    n2: Nested2;
    n3: Nested3;
    init() {
        self.n1 = Nested1{ a: 1 };
        self.n2 = Nested2{ a: 2 };
        self.n3 = Nested3{ a: 3 };
    }
}