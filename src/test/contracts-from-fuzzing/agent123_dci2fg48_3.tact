struct A {
    a1: Int;
    a2: Bool;
    a3: String;
}

struct B {
    b1: Int;
    b2: A;
    b3: Bool?;
    b4: String;
}

contract NestedOptionalFields {
    data: B;

    init() {
        self.data = B{
            b1: 2024,
            b2: A{
                a1: 1,
                a2: false,
                a3: "hello"
            },
            b3: true,
            b4: "world"
        };
    }
}