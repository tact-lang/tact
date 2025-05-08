struct A {
    value: Int;
}

struct B {
    inner: A;
    flag: Bool;
}

contract Test {
    nestedOpt: B?;
}