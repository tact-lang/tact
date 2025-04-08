struct A {
    x: Int;
    y: Bool;
}
struct B {
    a: A;
    b: A;
}
struct C {
    left: B;
    right: B;
}
contract Testing {
    deeply: C;
    init() {
        self.deeply = C {
            left: B{
                a: A{x: 1, y: true},
                b: A{x: 2, y: false}
            },
            right: B{
                a: A{x: 3, y: true},
                b: A{x: 4, y: false}
            }
        };
    }
}