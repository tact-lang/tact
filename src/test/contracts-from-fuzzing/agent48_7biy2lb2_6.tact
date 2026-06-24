struct InnerMost {
    a: Int; 
    b: Int?
}

struct Inner {
    c: Int;
    im: InnerMost;
}

struct Outer {
    inner: Inner;
    v: Int;
}

struct Top {
    one: Outer;
    two: Outer;
}

contract TestContract {
    state: Top;

    init() {
        self.state = Top {
            one: Outer {
                inner: Inner {
                    c: 3,
                    im: InnerMost{ a: 1, b: 2 } 
                },
                v: 5
            },
            two: Outer {
                inner: Inner {
                    c: 30,
                    im: InnerMost{ a: 10, b: null }
                },
                v: 50
            }
        };
    }
}