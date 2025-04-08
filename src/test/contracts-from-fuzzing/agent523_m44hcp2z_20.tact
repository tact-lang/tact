struct Inner {
    a: Int;
    b: String?;
}

struct Middle {
    m: Inner;
}

struct Outer {
    o: Middle;
}

contract LargeDeepNest {
    nest: Outer;

    init() {
        self.nest = Outer{
            o: Middle{
                m: Inner{
                    a: 5,
                    b: "deep"
                }
            }
        };
    }
}
