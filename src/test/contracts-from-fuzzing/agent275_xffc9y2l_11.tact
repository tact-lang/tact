struct InnerMost {
    x: Int;
}

struct Middle {
    val: InnerMost;
}

struct Outer {
    mid1: Middle;
    mid2: Middle;
}

contract MultipleNestedStructs {
    big: Outer;

    init() {
        self.big = Outer{
            mid1: Middle{ val: InnerMost{ x: 1 } },
            mid2: Middle{ val: InnerMost{ x: 2 } }
        };
    }
}