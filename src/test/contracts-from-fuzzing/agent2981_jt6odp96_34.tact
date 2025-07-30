struct A {
    f1: Int?;
    f2: Bool;
}

struct B {
    nested: A?;
}

contract OptionalMiddle {
    store: B;
    init() {
        self.store = B{
            nested: null,
        };
    }
}