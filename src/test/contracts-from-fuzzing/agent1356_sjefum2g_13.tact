struct Deep {
    inner: Middle?;
}

struct Middle {
    nested: Leaf?;
}

struct Leaf {
    x: Int;
}

contract DeepOptionalChain {
    data: Deep;

    init() {
        self.data = Deep{
            inner: null
        };
    }
}