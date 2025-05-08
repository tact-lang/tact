struct Inner {
    a: Int;
    b: Bool;
}

struct Middle {
    c: Inner;
    d: Inner;
}

struct Outer {
    e: Middle;
    f: Middle;
}

contract Nested {
    state: Outer;
    init() {
        self.state = Outer{
            e: Middle{
                c: Inner{a: 1, b: true},
                d: Inner{a: 2, b: false}
            },
            f: Middle{
                c: Inner{a: 3, b: false},
                d: Inner{a: 4, b: true}
            }
        };
    }
}
