struct A {
    val: Int?;
}

struct B {
    subA: A?;
    flag: Bool = false;
}

struct C {
    subB: B?;
    text: String?;
}

contract ComplexNest {
    state: C;

    init() {
        self.state = C{
            subB: B{
                subA: A{val: null},
                flag: true,
            },
            text: null,
        };
    }

    receive() {}
}