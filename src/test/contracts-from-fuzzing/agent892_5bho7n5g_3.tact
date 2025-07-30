struct A {
    b: B;
    flag: Bool;
}

struct B {
    c: C;
    num: Int;
}

struct C {
    d: D;
    str: String;
}

struct D {
    e: Bool;
}

contract Complex {
    state: A;

    init() {
        self.state = A{
            b: B{
                c: C{
                    d: D{e: true},
                    str: "test"
                },
                num: 42
            },
            flag: false
        };
    }
}