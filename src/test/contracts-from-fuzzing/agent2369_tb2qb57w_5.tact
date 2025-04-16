struct A {
    x: Int;
    b: B;
}

struct B {
    y: Int;
    c: C;
}

struct C {
    z: Int;
}

contract DeeplyNested {
    val: A;

    init() {
        self.val = A{
            x: 1,
            b: B{
                y: 2,
                c: C{ z: 3 }
            }
        };
    }
}