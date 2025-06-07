struct A {
    val: Int?;
}

struct B {
    nested: A?;
}

contract OptionalNested {
    store: B;

    init() {
        self.store = B{nested: null};
    }

    receive() {
        self.store = B{nested: self.store.nested};
    }
}