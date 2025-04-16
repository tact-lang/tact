struct A { a: Int; }
struct B { b: Int; }

contract SimilarStructs {
    a1: A;
    a2: A;
    b1: B;
    b2: B;

    init() {
        self.a1 = A{ a:1 };
        self.a2 = A{ a:2 };
        self.b1 = B{ b:3 };
        self.b2 = B{ b:4 };
    }
}