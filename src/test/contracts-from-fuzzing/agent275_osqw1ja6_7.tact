struct A {
    val_a: Int;
    b: B;
}

struct B {
    val_b: Bool;
    c: C;
}

struct C {
    val_c: String;
}

contract TestContract {
    nested: A;

    init() {
        self.nested = A{
            val_a: 1,
            b: B{
                val_b: true,
                c: C{
                    val_c: "deep"
                }
            }
        };
    }
}