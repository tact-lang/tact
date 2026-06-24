struct InnerMost {
    deepVal: Int;
}
struct Middle {
    midVal: Int;
    innerMost: InnerMost;
}
struct Top {
    topVal: Int;
    middle: Middle;
}

contract Test {
    data: Top;

    init() {
        self.data = Top{
            topVal: 1,
            middle: Middle{
                midVal: 2,
                innerMost: InnerMost{
                    deepVal: 3
                }
            }
        };
    }
}