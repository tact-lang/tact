struct Deeply {
    a: Int;
    b: Middle;
}

struct Middle {
    c: Inner;
}

struct Inner {
    d: Bool;
}

contract ChainNest {
    state: Deeply;

    init() {
        self.state = Deeply{
            a: 55,
            b: Middle{
                c: Inner{
                    d: false
                }
            }
        };
    }
}