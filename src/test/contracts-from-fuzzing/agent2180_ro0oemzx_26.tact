struct A {
    foo: Int = 1;
    bar: Bool = false;
    baz: String = "z";
}

struct B {
    a: A = A{}; // Use defaults
}

contract DefaultsNested {
    store: B;

    init() {
        self.store = B{}; // Use nested defaults
    }
}