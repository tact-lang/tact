// Deeply nested optional/struct chain, with filled innermost
struct C {
    val: Int;
}

struct B {
    c: C?;
}

struct A {
    b: B?;
}

contract DeepOptFilled {
    data: A;

    init() {
        self.data = A{
            b: B{
                c: C{ val: 999 }
            }
        };
    }
}