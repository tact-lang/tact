struct A { x: Int }

struct B {
    a: A;
    y: Int;
}

struct C {
    b: B;
    z: Int;
}

contract Test {
    deep: C;

    init() {
        self.deep = C{
            b: B{
                a: A{ x: 5 },
                y: 6
            },
            z: 7
        };
    }
}