struct A {
    valA: Int;
    next: B?;
}
struct B {
    valB: Int;
}

contract OptNestedStruct {
    field: A?;

    init() {
        self.field = null;
    }
}