struct A { a1: Int; opt: Int?; }
struct B { b1: Int; nested: A?; }

contract ComplexOption {
    b: B;

    init() {
        self.b = B{ b1: 1, nested: null };
    }
}