struct A {
    a1: Int;
    a2: Bool;
}

struct B {
    b1: Int;
    b2: String;
    nestedA: A;
}

struct C {
    c1: Bool;
    nestedB: B;
    optionalA: A?;
}

contract DeepMultiNestedContract {
    data: C;

    init() {
        self.data = C{
            c1: true,
            nestedB: B{ b1: 10, b2: "hi", nestedA: A{ a1: 1, a2: false } },
            optionalA: null
        };
    }
}