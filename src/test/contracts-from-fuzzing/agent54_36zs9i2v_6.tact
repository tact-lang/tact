struct A { a: Int; }
struct B { b: Int; }
struct C { c: Int; }

struct Top {
    one: A;
    two: B;
    three: C;
}

contract TripleNested {
    data: Top;

    init() {
        self.data = Top{
            one: A{a:1},
            two: B{b:2},
            three: C{c:3}
        };
    }
}