struct Wrap {
    a: Int;
}

struct Outer {
    a: Wrap;
    b: Wrap;
    c: Wrap;
}

contract Test48 {
    o: Outer;

    init() {
        self.o = Outer{
            a: Wrap{a:1},
            b: Wrap{a:2},
            c: Wrap{a:3}
        };
    }
}