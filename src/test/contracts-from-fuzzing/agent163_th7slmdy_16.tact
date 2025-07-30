struct InnerMost {
    a: Int;
}
struct Middle {
    im: InnerMost;
}
struct OuterMost {
    mid: Middle;
    comment: String;
}

contract ComplexNested {
    s: OuterMost;
    init() {
        self.s = OuterMost{
            mid: Middle{
                im: InnerMost{ a:123 }
            },
            comment: "hi"
        };
    }
}