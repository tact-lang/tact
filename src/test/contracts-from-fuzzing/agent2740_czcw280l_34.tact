struct Nested1 {
    a: Int;
}

struct Nested2 {
    b: Nested1;
}

contract MultiLayer {
    n: Nested2;

    init() {
        self.n = Nested2{ b: Nested1{ a:77 } };
    }
}