struct Nested1 {
    n: Int;
}

struct Nested2 {
    inner: Nested1;
}

struct Nested3 {
    inner: Nested2;
}

contract DeepNest {
    data: Nested3;
    init() {
        self.data = Nested3{ inner: Nested2{ inner: Nested1{ n: 5 } } };
    }
}