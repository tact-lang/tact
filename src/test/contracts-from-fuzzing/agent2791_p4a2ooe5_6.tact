struct A {
    b: B?;
    flag: Bool;
}

struct B {
    text: String;
    c: C;
}

struct C {
    number: Int;
}

contract TestContract {
    nestedOptional: A;

    init() {
        self.nestedOptional = A{
            b: B{
                text: "deep opt",
                c: C{ number: 999 },
            },
            flag: true,
        };
    }
}
