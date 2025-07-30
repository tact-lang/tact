struct InnerMost {
    num: Int = 42;
}

struct Middle {
    leaf: InnerMost?;
}

struct Top {
    mid: Middle;
}

contract DefaultsNested {
    root: Top;

    init() {
        self.root = Top{
            mid: Middle{
                leaf: null
            }
        };
    }
}