struct InnerMost {
    q: Int?;
    r: Bool;
    s: String;
}

struct Inner {
    x: Int;
    y: InnerMost;
}

struct Outer {
    a: Int;
    b: Bool;
    c: Inner;
}

contract ComplexNested {
    data: Outer = Outer{
        a: 5,
        b: true,
        c: Inner{
            x: 10,
            y: InnerMost{
                q: null,
                r: false,
                s: "hi"
            }
        }
    };
}