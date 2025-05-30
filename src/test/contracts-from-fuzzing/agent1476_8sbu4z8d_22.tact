struct A {
    val: Int;
    b: B;
}

struct B {
    val: Int;
    c: C;
}

struct C {
    flag: Bool?;
}

contract NestedOptionalInner {
    data: A;

    init() {
        self.data = A{
            val: 1,
            b: B{
                val: 2,
                c: C{
                    flag: null,
                },
            },
        };
    }
}