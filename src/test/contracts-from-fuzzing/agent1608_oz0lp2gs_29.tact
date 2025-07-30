// deeply optional contract storage
struct Leaf {
    x: Int;
}

struct Middle {
    l: Leaf?;
}

struct TopMost {
    m: Middle?;
}

contract DeepOptional {
    opt: TopMost?;

    init() {
        self.opt = TopMost{
            m: Middle{
                l: Leaf{ x: 99 }
            }
        };
    }
}