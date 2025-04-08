struct InnerMost {
    val: Int;
}

struct Middle {
    inner: InnerMost;
}

struct Outer {
    middle: Middle;
}

contract SinglePath {
    field: Outer = Outer{
        middle: Middle{ inner: InnerMost{ val: 123 } }
    };

    init() {
        self.field = Outer{
            middle: Middle{ inner: InnerMost{ val: 456 } }
        };
    }
}