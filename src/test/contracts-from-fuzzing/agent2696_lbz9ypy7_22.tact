struct A {
    b: Int?;
}

struct B {
    c: Int;
    d: A?;
}

contract NestedOptional {
    s: B;

    init() {
        self.s = B{
            c: 1,
            d: null,
        };
    }
}