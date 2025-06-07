struct A {
    x: Int;
    y: Int;
}

struct B {
    a: A;
    b: A;
}

struct C {
    x: Int;
    y: A;
    z: B;
}

contract DeeplyMultiplyNested {
    val: C;

    init() {
        self.val = C{
            x: 5,
            y: A{ x: 1, y: 2 },
            z: B{ a: A{ x: 3, y: 4 }, b: A{ x: 5, y: 6 } },
        };
    }
}
