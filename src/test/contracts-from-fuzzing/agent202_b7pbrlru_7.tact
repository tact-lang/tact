struct InnerMost {
    foo: Int?;
    bar: Bool;
}

struct Deep2 {
    im: InnerMost;
    v: Int;
}

struct Deep1 {
    d2: Deep2;
    f: Bool?;
}

contract ManyNestedOptionals {
    s: Deep1;
    init() {
        self.s = Deep1{
            d2: Deep2{
                im: InnerMost{
                    foo: null,
                    bar: true
                },
                v: 7
            },
            f: false
        };
    }
    receive() {
        let _ = self.s.d2.im.bar;
    }
}