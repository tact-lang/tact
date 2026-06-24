struct Inner {
    a: Int;
    b: Bool;
}

struct Middle {
    inner: Inner;
    c: Int?;
}

struct Outer {
    middle: Middle;
    d: String?;
}

contract ThreeLevel {
    state: Outer;

    init() {
        self.state = Outer{
            middle: Middle{
                inner: Inner{a:1, b:true},
                c: null
            },
            d: null
        };
    }
}