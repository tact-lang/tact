struct InnerMost {
    b: Bool = true;
}

struct Middle {
    inner: InnerMost;
    text: String = "hey";
}

struct Outer {
    mid: Middle;
    opt: Int?;
}

contract MultiStructs {
    composite: Outer;

    init() {
        self.composite = Outer{
            mid: Middle{
                inner: InnerMost{
                    b: false
                },
                text: "hello"
            },
            opt: null
        };
    }
}