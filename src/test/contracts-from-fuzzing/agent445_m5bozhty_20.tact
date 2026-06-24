struct A { a: Int }
struct B { b: Int }
struct C { c: Int }

struct DeepNest {
    one: A;
    two: B;
    three: C;
}

contract DeepContract {
    nested: DeepNest;
    init() {
        self.nested = DeepNest{
            one: A{a:1},
            two: B{b:2},
            three: C{c:3}
        };
    }
}