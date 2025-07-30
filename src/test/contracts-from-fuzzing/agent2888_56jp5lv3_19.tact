// multiple nested optional structs with inner optionals
struct A {
    v: Int?;
}

struct B {
    aopt: A?;
}

struct C {
    bopt: B?;
}

contract DeepOptChain {
    field: C;

    init() {
        self.field = C{
            bopt: null,
        };
    }
}