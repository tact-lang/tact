struct A {
    foo: Int?;
}

struct B {
    nested: A?;
}

contract NestedOptionals {
    data: B;
    init() {
        self.data = B{nested: null};
    }
}