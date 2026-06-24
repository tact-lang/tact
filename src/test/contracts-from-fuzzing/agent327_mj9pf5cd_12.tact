struct Bottom {
    w: Int;
}

struct Middle {
    b: Bottom?;
}

struct TopMost {
    m: Middle?;
}

contract DeepOptionalNest {
    dep: TopMost;

    init() {
        self.dep = TopMost{ m: null };
    }
}
