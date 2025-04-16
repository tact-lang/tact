struct InnerMost {
    x: Int;
    y: Bool;
    z: String;
}

struct Middle {
    im: InnerMost;
    another: Bool;
}

struct Outer {
    m: Middle;
    s: String;
}

contract DeepNestVars {
    o: Outer;

    init() {
        self.o = Outer{
            m: Middle{
                im: InnerMost{
                    x: 7,
                    y: false,
                    z: "end",
                },
                another: true,
            },
            s: "start",
        };
    }
}