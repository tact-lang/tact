struct A {
    foo: Int;
}

struct B {
    bar: A;
    baz: Int;
}

contract NestedMultiple {
    val: B;

    init() {
        self.val = B{ bar: A{ foo: 8 }, baz: 9 };
    }
}