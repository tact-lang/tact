struct Inner1 {
    v: Int;
}

struct Inner2 {
    v: Inner1;
}

struct S {
    a: Inner1;
    b: Inner2;
    c: Int;
}

contract StructWithRepeatedNested {
    field: S;

    init() {
        self.field = S{
            a: Inner1{ v: 1 },
            b: Inner2{ v: Inner1{ v: 2 } },
            c: 3
        };
    }
}