struct C {
    x: Int as uint32;
}

struct B {
    copt: C?;
}

struct A {
    bopt: B?;
}

contract Layered {
    top: A? = A{
        bopt: B{
            copt: C{ x: 9 },
        },
    };
}