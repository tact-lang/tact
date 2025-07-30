struct A {
    a: Int as uint8;
}

struct B {
    b: A;
}

struct C {
    c: B;
}

contract DeepNested {
    val: C;

    init() {
        self.val = C{
            c: B{
                b: A{
                    a: 255
                }
            }
        };
    }
}