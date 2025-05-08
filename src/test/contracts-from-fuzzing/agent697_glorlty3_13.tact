struct A {
    f: B;
}

struct B {
    g: String;
    h: C;
}

struct C {
    i: Int;
    j: Bool;
}

contract DeepNest {
    val: A;

    init() {
        self.val = A{
            f: B{
                g: "hello",
                h: C{ i: 1, j: true }
            }
        };
    }
}