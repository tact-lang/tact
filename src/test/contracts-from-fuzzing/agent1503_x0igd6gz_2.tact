struct A {
    foo: Int;
}

struct B {
    bar: Int;
}

contract TestContract {
    field1: A; 
    field2: B;

    init() {
        self.field1 = A{foo: 1};
        self.field2 = B{bar: 2};
    }
}
