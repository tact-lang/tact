struct Nested1 {
    val: Int;
}

struct Nested2 {
    field1: Nested1;
    field2: Int;
}

contract TestContract {
    field: Nested2;

    init() {
        self.field = Nested2{ field1: Nested1{ val: 7 }, field2: 42 };
    }
}