struct A {
    foo: Int;
    bar: String?;
}
struct B {
    nested: A?;
}

contract OptNestedStruct {
    data: B;
    init() {
        self.data = B{ nested: null };
    }
}
