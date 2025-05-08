struct Leaf {
    d: Int;
}

struct Mid {
    l: Leaf?;
}

struct Root {
    m: Mid;
}

contract Deep {
    r: Root;
    init() {
        self.r = Root{
            m: Mid{
                l: null
            }
        };
    }
}