struct A {
    rest: Cell as remaining;
}

struct B {
    a: A?;
}

contract NestedOptRemain {
    s: B = B{ a: null };
    init() {}
}