struct InnerA { valA: Int; }
struct InnerB { valB: Int; }
struct Outer {
    x: InnerA;
    y: InnerB;
    xOpt: InnerA?;
    yOpt: InnerB?;
}

contract MixedNestedOptional {
    storage: Outer;
    init() {
        self.storage = Outer{
            x: InnerA{ valA: 1 },
            y: InnerB{ valB: 2 },
            xOpt: null,
            yOpt: null
        };
    }
}