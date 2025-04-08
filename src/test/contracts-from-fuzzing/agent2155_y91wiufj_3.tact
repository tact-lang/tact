struct A {
    foo: Int;
}

struct B {
    nested: A?;
    count: Int;
}

contract TestContract {
    data: B;
    
    init() {
        self.data = B{ nested: null, count: 42 };
    }
}