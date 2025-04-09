struct A { foo: Int; }
struct B { bar: Int; }
struct C { baz: Int; }

struct Combo {
    one: A;
    two: B;
    three: C;
}

contract ManyNestedStructs {
    field: Combo;

    init() {
        self.field = Combo{
            one: A{foo: 1},
            two: B{bar: 2},
            three: C{baz: 3}
        };
    }
}