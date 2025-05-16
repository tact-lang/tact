struct InnerMost {
    x: Int;
    y: Bool;
    s: String;
}

struct Middle {
    a: Int;
    inner: InnerMost;
    b: String;
}

contract ManyNest {
    mid: Middle;

    init() {
        self.mid = Middle{
            a: 7,
            inner: InnerMost{
                x: 1,
                y: false,
                s: "str"
            },
            b: "tail"
        };
    }
}