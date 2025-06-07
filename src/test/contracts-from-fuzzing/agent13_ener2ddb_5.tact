struct InnerMost {
    a: Int;
    b: String;
}

struct Middle {
    i1: InnerMost;
    i2: InnerMost;
}

struct Outer {
    m: Middle;
    optM: Middle?;
}

contract NestedTest {
    val: Outer;

    init() {
        self.val = Outer{
            m: Middle{
                i1: InnerMost{ a: 1, b: "x" },
                i2: InnerMost{ a: 2, b: "y" }
            },
            optM: null
        };
    }
}