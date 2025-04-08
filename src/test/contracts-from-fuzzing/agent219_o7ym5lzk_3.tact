struct InnerMost {
    val: Int;
    opt: Bool?;
    text: String;
}

struct Middle {
    iVal: Int;
    flag: Bool;
    nested: InnerMost;
    maybeInner: InnerMost?;
}

contract DoubleNestedOpt {
    middleData: Middle?;

    init() {
        self.middleData = Middle{
            iVal: 99,
            flag: true,
            nested: InnerMost{
                val: 11,
                opt: false,
                text: "abc"
            },
            maybeInner: null
        };
    }
}