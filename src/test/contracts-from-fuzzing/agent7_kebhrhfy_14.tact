struct A {
    x: Int;
}

struct B {
    a: A;
    y: Int;
}

struct C {
    b: B;
    z: Bool;
}

contract OrderedStructs {
    data: C;
    init() {
        self.data = C{
            b: B{
                a: A{ x: 1 },
                y: 2
            },
            z: true
        };
    }
}