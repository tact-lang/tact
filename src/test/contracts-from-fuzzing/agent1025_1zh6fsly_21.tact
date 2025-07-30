struct A { f: Int; }
struct B { g: Bool; }
struct C { h: String; }
struct D { a: A; b: B; c: C; }

contract MultiAgg {
    d: D;

    init() {
        self.d = D{
            a: A{f:1},
            b: B{g:true},
            c: C{h:"hi"}
        };
    }
}
