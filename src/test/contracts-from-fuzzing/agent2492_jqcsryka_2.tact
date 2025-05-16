struct Inner1 {
    a: Int;
}

struct Inner2 {
    x: Bool;
    y: Inner1;
}

struct Middle {
    p: Inner2;
    q: Int?;
}

struct Outer {
    m: Middle;
    f: Bool;
}

contract ComplexNested {
    state: Outer;
    init() {
        self.state = Outer{
            m: Middle{
                p: Inner2{
                    x: true,
                    y: Inner1{a: 99}
                },
                q: null
            },
            f: false
        };
    }
}