struct A {
    x: Int;
    y: Int;
}

struct B {
    a: A;
    s: String;
}

struct C {
    b: B;
    flag: Bool;
}

contract DeepHierarchy {
    root: C;

    init() {
        self.root = C{
            b: B{
                a: A{
                    x: 1,
                    y: 2,
                },
                s: "deep",
            },
            flag: true,
        };
    }
}
