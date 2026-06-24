struct A {
    val: Int?;
}

struct B {
    nested: A;
}

struct C {
    nested: B?;
}

contract OptionalNestCombo {
    storage: C;

    init() {
        self.storage = C{
            nested: null,
        };
    }
}