struct A {
    value: Int;
}

struct B {
    optA: A?;
}

contract OptionalStructInField {
    field: B;

    init() {
        self.field = B{ optA: null };
    }
}
