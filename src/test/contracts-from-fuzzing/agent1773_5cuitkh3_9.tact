struct Nested1 {
    a: Int;
}

struct Nested2 {
    b: Nested1;
}

struct Nested3 {
    c: Nested2;
}

contract Nested3Contract {
    field: Nested3;

    init() {
        self.field = Nested3{ c: Nested2{ b: Nested1{ a: 777 } } };
    }
}