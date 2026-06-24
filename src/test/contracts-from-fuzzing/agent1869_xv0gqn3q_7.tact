struct InnerMost {
    val: Int;
}

struct Middle {
    inner: InnerMost;
}

struct Outer {
    middle1: Middle;
    middle2: Middle;
    middle3: Middle;
}

contract MultipleNestedStructs {
    nest: Outer;

    init() {
        self.nest = Outer{
            middle1: Middle{ inner: InnerMost{ val: 1 } },
            middle2: Middle{ inner: InnerMost{ val: 2 } },
            middle3: Middle{ inner: InnerMost{ val: 3 } }
        };
    }
}