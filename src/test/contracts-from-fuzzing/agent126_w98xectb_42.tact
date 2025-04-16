struct A { a: Int }
struct B { b: Int }
struct C { c: Int }

struct Top {
    one: A?;
    two: B?;
    three: C?;
}

contract NestedOptionals {
    f: Top;
    init() {
        self.f = Top{ one:null, two:null, three:null };
    }
}