struct DeepInner {
    x: Int;
}

struct Mid {
    inner: DeepInner;
}

struct Outer {
    mid: Mid;
}

contract TestDeepNested {
    nest: Outer;

    init() {
        self.nest = Outer{
            mid: Mid{
                inner: DeepInner{
                    x: 999
                }
            }
        };
    }
}