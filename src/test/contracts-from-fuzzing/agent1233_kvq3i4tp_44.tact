struct Inner {
    s: String;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract StringNest {
    outer: Outer;

    init() {
        self.outer = Outer{
            middle: Middle{inner: Inner{s: "x"}}
        };
    }
}