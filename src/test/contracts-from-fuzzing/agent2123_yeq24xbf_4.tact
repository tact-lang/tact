struct NestedTwoLevels {
    inner1: String;
    inner2: Int;
}

struct NestedTop {
    sub1: NestedTwoLevels;
    sub2: NestedTwoLevels;
}

contract DoubleStructNested {
    data: NestedTop;

    init() {
        self.data = NestedTop{
            sub1: NestedTwoLevels{ inner1: "first", inner2: 1 },
            sub2: NestedTwoLevels{ inner1: "second", inner2: 2 },
        };
    }
}