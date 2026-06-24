struct Inner1 {
    a: Int;
    b: String;
}

struct Inner2 {
    c: Bool;
    d: Inner1;
    e: String;
}

struct Middle {
    f: Inner2;
    g: Int?;
}

struct Outer {
    h: Middle;
    i: Bool;
}

contract TestContract {
    big: Outer;
    init() {
        self.big = Outer{
            h: Middle{
                f: Inner2{
                    c: false,
                    d: Inner1{ a: 1, b: "X" },
                    e: "Y"
                },
                g: null
            },
            i: true
        };
    }
}