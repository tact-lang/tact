struct Nested1 {
    foo: Int;
}

struct Nested2 {
    bar: Nested1;
}

contract TestNestedStruct {
    val: Nested2;
    init() {
        self.val = Nested2{ bar: Nested1{ foo: 123 } };
    }
}