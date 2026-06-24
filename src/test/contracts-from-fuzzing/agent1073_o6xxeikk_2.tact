struct InnerMost {
    deepVal: Int;
}

struct Middle {
    nested: InnerMost;
}

struct Outer {
    middle: Middle;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                nested: InnerMost{ deepVal: 42 }
            }
        };
    }
}