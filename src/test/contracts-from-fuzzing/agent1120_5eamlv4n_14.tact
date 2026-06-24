struct InnerMost {
    z: Int;
}

struct Middle {
    midField: InnerMost;
}

struct OuterMost {
    outerField: Middle;
}

contract NestedAssign {
    s: OuterMost;

    init() {
        self.s = OuterMost{
            outerField: Middle{
                midField: InnerMost{ z: 777 },
            },
        };
    }
}