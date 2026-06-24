struct A { s: String?; i: Int?; }
struct B { a: A?; b: Bool; }
struct C { b: B; }

contract ChainOptional {
    data: C;

    init() {
        self.data = C{ b: B{ a: null, b: true } };
    }
}
