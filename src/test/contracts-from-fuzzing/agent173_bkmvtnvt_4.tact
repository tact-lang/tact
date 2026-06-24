struct C {
    cx: Int;
    cy: Bool;
}

struct B {
    bx: C;
    by: Int?;
}

struct A {
    ax: Int;
    ay: B;
}

contract DeepNested {
    s: A;

    init() {
        self.s = A{
            ax: 1,
            ay: B{
                bx: C{ cx: 2, cy: true },
                by: null
            }
        };
    }
}