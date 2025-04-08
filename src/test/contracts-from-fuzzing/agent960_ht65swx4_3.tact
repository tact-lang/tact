struct A {
    a1: Int;
    a2: Int?;
    a3: Bool;
    a4: String;
}

struct B {
    b1: Bool;
    nested: A;
    b2: Int?;
    b3: String;
}

contract ComplexFields {
    field: B;
    init() {
        self.field = B{
            b1: false,
            nested: A{
                a1: 100,
                a2: null,
                a3: true,
                a4: "hello"
            },
            b2: 5,
            b3: "world",
        };
    }
}