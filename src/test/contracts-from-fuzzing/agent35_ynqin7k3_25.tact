struct A { v: Int; }
struct B { v: Int; }

contract TwoStructs {
    a: A;
    b: B;

    init() {
        self.a = A{ v: 7 };
        self.b = B{ v: 9 };
    }
}