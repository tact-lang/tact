struct B {
    val: Int;
}

struct A {
    nested: B;
}

contract InitNestedOrderTest {
    field: A;

    init() {
        self.field = A{nested: B{val: 123}};
    }
}