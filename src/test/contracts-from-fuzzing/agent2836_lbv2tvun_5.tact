struct InnerMost {
    z: Int;
    b: Bool;
}

struct Mid {
    im: InnerMost;
    s: String;
}

struct Outer {
    m: Mid;
    x: Int;
}

contract DeeplyNested {
    data: Outer;

    init() {
        self.data = Outer{
            m: Mid{
                im: InnerMost{
                    z: 1,
                    b: true
                },
                s: "hi"
            },
            x: 42
        };
    }
}