struct InnerMost {
    flag: Bool;
    val: Int?;
}

struct Middle {
    nested: InnerMost;
    label: String;
}

struct Outer {
    m1: Middle;
    m2: Middle;
    optInt: Int?;
}

contract NestedStructsTest {
    storage: Outer;

    init() {
        self.storage = Outer{
            m1: Middle{
                nested: InnerMost{
                    flag: true,
                    val: null
                },
                label: "First"
            },
            m2: Middle{
                nested: InnerMost{
                    flag: false,
                    val: 777
                },
                label: "Second"
            },
            optInt: null
        };
    }
}
