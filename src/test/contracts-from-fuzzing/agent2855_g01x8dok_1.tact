struct InnerMost {
    a: Int;
    b: Bool;
}

struct Middle {
    m1: Int;
    m2: InnerMost;
    m3: String?;
}

struct Outer {
    o1: Int;
    o2: Middle;
    o3: Bool?;
    o4: String;
}

contract NestedStructsTest {
    val: Outer;

    init() {
        self.val = Outer{
            o1: 1,
            o2: Middle{
                m1: 2,
                m2: InnerMost{
                    a: 3,
                    b: true,
                },
                m3: "middle",
            },
            o3: false,
            o4: "outer",
        };
    }
}