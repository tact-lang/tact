struct A {
    f1: Int;
    f2: String;
}

struct B {
    f3: Bool;
    f4: A;
}

struct C {
    f5: Int;
    f6: B;
    f7: String;
}

contract ManyNestings {
    s: C;
    init() {
        self.s = C {
            f5: 1,
            f6: B {
                f3: false,
                f4: A {
                    f1: 7,
                    f2: "foo"
                }
            },
            f7: "bar"
        };
    }
}