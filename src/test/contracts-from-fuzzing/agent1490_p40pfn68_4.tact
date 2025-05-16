struct InnerMost {
    val: Int;
}

struct Middle {
    inner: InnerMost;
}

struct Outer {
    middle: Middle;
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: InnerMost{ val: 1 }
            }
        };
    }
}