struct NestedSame {
    x: Int;
}

struct OuterAllSame {
    a: NestedSame;
    b: NestedSame;
    c: NestedSame;
}

contract TestContract {
    f: OuterAllSame;

    init() {
        self.f = OuterAllSame{
            a:NestedSame{x:1},
            b:NestedSame{x:2},
            c:NestedSame{x:3}
        };
    }
}