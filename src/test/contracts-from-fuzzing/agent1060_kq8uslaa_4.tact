struct InnerMost {
    x: Int?;
    y: Bool;
}

struct Mid {
    z: InnerMost?;
    flag: Bool?;
}

struct Outer {
    mid1: Mid?;
    mid2: Mid;
}

contract ComplexNestedOptionals {
    data: Outer;

    init() {
        self.data = Outer{
            mid1: null,
            mid2: Mid{
                z: InnerMost{
                    x: 5,
                    y: true
                },
                flag: false
            }
        };
    }
}