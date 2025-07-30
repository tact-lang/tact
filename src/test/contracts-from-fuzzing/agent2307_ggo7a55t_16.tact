struct BigNest {
    a: A1;
    b: B1;
}

struct A1 {
    a: A2;
}

struct A2 {
    a: Int;
}

struct B1 {
    b: B2;
}

struct B2 {
    b: Int;
}

contract DeepNesting {
    store: BigNest;

    init() {
        self.store = BigNest{
            a: A1{a: A2{a: 10}},
            b: B1{b: B2{b: 20}}
        };
    }
}
