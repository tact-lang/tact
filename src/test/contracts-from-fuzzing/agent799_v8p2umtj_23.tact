struct Nested1 {
    a: Int;
}
struct Nested2 {
    n1: Nested1;
}
struct Nested3 {
    n2: Nested2;
}

contract DeepPersist {
    deep: Nested3;

    init() {
        self.deep = Nested3{ n2: Nested2{ n1: Nested1{ a: 42 } } };
    }
}