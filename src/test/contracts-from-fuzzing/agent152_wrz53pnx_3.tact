struct Nested1 {
    val: Int;
}

struct Nested2 {
    nested: Nested1;
}

struct Nested3 {
    nested: Nested2;
}

contract DeepNestedContract {
    data: Nested3;

    init() {
        self.data = Nested3{ nested: Nested2{ nested: Nested1{ val: 123 } } };
    }
}
