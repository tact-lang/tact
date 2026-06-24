struct Nested1 {
    val: Int;
}

struct Nested2 {
    nest: Nested1;
}

struct Nested3 {
    nest: Nested2;
}

contract DeepNestTest {
    field: Nested3;

    init() {
        self.field = Nested3{ nest: Nested2{ nest: Nested1{ val: 123 } } };
    }
}