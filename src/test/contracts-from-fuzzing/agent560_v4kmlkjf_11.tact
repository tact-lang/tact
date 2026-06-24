struct A {
    val: Int;
}

struct B {
    foo: A;
    opt: Int?;
}

contract OptNested {
    s: B;

    init() {
        self.s = B{
            foo: A{
                val: 3
            },
            opt: null,
        };
    }
}