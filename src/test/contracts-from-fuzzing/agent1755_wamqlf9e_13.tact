struct Inner {
    a: Int;
    b: String;
}

struct Middle {
    c: Bool;
    d: Inner;
}

contract ManyNested {
    f: Middle;

    init() {
        self.f = Middle{
            c: false,
            d: Inner{
                a: 7,
                b: "nested"
            }
        };
    }
}