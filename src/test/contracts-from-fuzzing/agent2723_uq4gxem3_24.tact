struct Nested1 {
    v: Int;
}

struct Nested2 {
    n1: Nested1;
}

struct Nested3 {
    n2: Nested2;
}

contract Nest3 {
    d: Nested3;
    init() {
        self.d = Nested3{ n2: Nested2{ n1: Nested1{ v: 99 } } };
    }
}