struct Leaf {
    leafVal: Int?;
}

struct Middle {
    midVal: Int?;
    leaf: Leaf?;
}

struct Top {
    topVal: Int?;
    mid: Middle?;
}

contract DeepOptChain {
    storage: Top;

    init() {
        self.storage = Top{
            topVal: null,
            mid: Middle{
                midVal: null,
                leaf: Leaf{
                    leafVal: null
                }
            }
        };
    }
}