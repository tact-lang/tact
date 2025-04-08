struct A {
    value: Int;
    nested: B;
}

struct B {
    flag: Bool;
    deep: C;
}

struct C {
    text: String;
    number: Int;
}

contract DeepNest {
    a: A;

    init() {
        self.a = A{
            value: 5,
            nested: B{
                flag: true,
                deep: C{
                    text: "hi",
                    number: 7,
                },
            },
        };
    }
}
