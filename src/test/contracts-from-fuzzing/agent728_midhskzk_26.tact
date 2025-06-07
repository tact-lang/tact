struct DeepInner {
    coinsVal: Int as coins;
    smallVal: Int as uint8;
}

struct Middle {
    midVal: Int as int64;
    deeper: DeepInner;
}

contract NestedSerials {
    data: Middle;

    init() {
        self.data = Middle{
            midVal: 9999,
            deeper: DeepInner{
                coinsVal: 100000,
                smallVal: 8
            }
        };
    }
}