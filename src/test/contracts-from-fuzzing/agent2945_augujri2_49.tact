struct A {
    x: Int;
}

struct B {
    a: A?;
}

contract OptNestedStruct {
    b: B;

    init() {
        self.b = B{a: null};
    }
}