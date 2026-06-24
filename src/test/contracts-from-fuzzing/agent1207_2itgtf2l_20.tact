struct A {
    n: Int;
    s: String;
}

struct B {
    a: A;
    n: Int;
    s: String;
}

struct C {
    b: B;
    a: A;
    s: String;
}

contract LargeNested {
    c: C;

    init() {
        self.c = C{
            b: B{
                a: A{ n: 1, s: "a" },
                n: 2,
                s: "b"
            },
            a: A{ n: 3, s: "c" },
            s: "d"
        };
    }
}