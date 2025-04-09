struct Leaf {
    val: Int as uint8;
}

struct Middle {
    leaf: Leaf?;
    midVal: Int as uint16;
}

struct Top {
    middle: Middle;
    topFlag: Bool;
}

contract DeeplyNestedStructs {
    store: Top;

    init() {
        self.store = Top{
            middle: Middle{
                leaf: null,
                midVal: 512
            },
            topFlag: true
        };
    }
}