struct InnerMost {
    z: Int;
    b: Bool;
}

struct Middle {
    midVal: InnerMost;
}

struct Outer {
    x: Int;
    middle: Middle;
}

contract NestedStructsTest {
    s: Outer;

    init() {
        self.s = Outer{
            x: 99,
            middle: Middle {
                midVal: InnerMost{ z: 123, b: true }
            }
        };
    }
}