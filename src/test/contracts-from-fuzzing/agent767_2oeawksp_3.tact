struct A {
    b: B?;
}

struct B {
    c: C;
}

struct C {
    d: Int;
}

contract ChainNested {
    item: A;

    init() {
        self.item = A{ b: null };
    }
}