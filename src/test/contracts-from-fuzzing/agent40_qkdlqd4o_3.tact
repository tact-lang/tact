struct Nested1 {
    x: Int;
}

struct Nested2 {
    a: Nested1;
}

struct Nested3 {
    b: Nested2;
}

contract StorageDeepNested {
    val: Nested3;

    init() {
        self.val = Nested3{ b: Nested2{ a: Nested1{ x: 42 } } };
    }
}