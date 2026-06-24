struct Thin1 { a: Int }
struct Thin2 { a: Int }
struct Thin3 { a: Int }

struct Fat {
    t1: Thin1;
    t2: Thin2;
    t3: Thin3;
}

contract NestedPrimitives {
    f: Fat;

    init() {
        self.f = Fat{
            t1: Thin1{a:1},
            t2: Thin2{a:2},
            t3: Thin3{a:3},
        };
    }
}
