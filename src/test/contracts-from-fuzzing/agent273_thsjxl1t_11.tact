struct Outer {
    a: Int;
    nested: Middle;
}

struct Middle {
    b: Int;
    nested2: Inner;
}

struct Inner {
    c: Int;
}

contract Test11 {
    record: Outer;

    init() {
        self.record = Outer{
            a: 7,
            nested: Middle{
                b: 8,
                nested2: Inner{ c: 9 }
            }
        };
    }
}