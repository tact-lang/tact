struct A {
    foo: Int;
}

struct B {
    a: A;
    optfoo: Int?;
}

contract C(
    param1: Int,
    param2: B,
    param3: A,
    param4: B?,
    param5: Int?,
    param6: String?
) {}