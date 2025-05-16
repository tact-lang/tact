struct InnerMost {
    v: Int
}

struct Mid {
    inner: InnerMost;
}

struct Outer {
    mid: Mid;
}

contract DeepChain {
    outer: Outer;

    init() {
        self.outer = Outer{
            mid: Mid{ inner: InnerMost{ v: 123 }}
        };
    }
}