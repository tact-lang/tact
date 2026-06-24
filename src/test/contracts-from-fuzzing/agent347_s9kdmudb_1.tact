struct Nested1 {
    a: Int;
}

struct Nested2 {
    b: Nested1;
}

contract TestContract {
    data: Nested2;

    init() {
        self.data = Nested2{ b: Nested1{ a: 1 } };
    }
}