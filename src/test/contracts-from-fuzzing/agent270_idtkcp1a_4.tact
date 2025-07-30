struct InnerMost {
    a: Int;
}

struct Inner {
    im: InnerMost;
    b: Bool;
}

struct Outer {
    i: Inner;
    s: String;
}

contract DeepNestTest {
    nest: Outer;

    init() {
        self.nest = Outer{
            i: Inner{
                im: InnerMost{
                    a: 5
                },
                b: false
            },
            s: "deep"
        };
    }
}