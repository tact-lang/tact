struct InnerMost {
    val: Int;
    text: String;
    toggle: Bool;
}

struct Middle {
    im: InnerMost;
    optIm: InnerMost?;
    s: String;
}

struct Outer {
    m: Middle;
    flag: Bool;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{
            m: Middle{
                im: InnerMost{ val: 1, text: "hi", toggle: true },
                optIm: null,
                s: "outer"
            },
            flag: false
        };
    }
}