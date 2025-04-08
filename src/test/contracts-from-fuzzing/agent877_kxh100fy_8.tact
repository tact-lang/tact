struct InnerMost {
    b: Bool;
    s: String;
}

struct Middle {
    a: Int;
    im: InnerMost;
}

struct Top {
    m: Middle;
    t: String;
}

contract DeeplyNested {
    complex: Top;

    init() {
        self.complex = Top{
            m: Middle{
                a:1,
                im: InnerMost{ b:true, s:"hi" }
            },
            t: "ok"
        };
    }
}