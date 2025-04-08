struct A {
    f1: Int;
    f2: B;
}

struct B {
    x1: Int;
    x2: Bool;
    x3: C;
}

struct C {
    y1: Int;
    y2: Bool;
    y3: String;
}

contract TestContract {
    compound: A;

    init() {
        self.compound = A{
            f1: 10,
            f2: B{
                x1: 20,
                x2: false,
                x3: C{
                    y1: 30,
                    y2: true,
                    y3: "ok"
                }
            }
        };
    }
}