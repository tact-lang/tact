struct A {
    x: Int;
}

struct B {
    a: A;
    y: String;
}

struct C {
    b: B;
    z: Bool;
}

contract NestedComposition {
    rec: C;

    init() {
        self.rec = C{
            b: B{
                a: A{x:42},
                y: "hi"
            },
            z: false
        };
    }
}