// Struct deeply nested with optionals and defaults
struct Bottom {
    n: Int = 5;
}

struct Mid {
    bot: Bottom?;
    s: String = "hi";
}

struct TopMost {
    mid: Mid?;
    b: Bool = true;
}

contract DeepMix {
    state: TopMost;

    init() {
        self.state = TopMost{mid: null, b: false};
    }
}