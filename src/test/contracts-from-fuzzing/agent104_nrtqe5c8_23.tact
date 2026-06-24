struct OptionalLayer {
    s: String?;
    n: Int?;
}

struct TopLayer {
    embed: OptionalLayer?;
}

contract HigherOptionals {
    root: TopLayer;
    init() {
        self.root = TopLayer{
            embed: null
        };
    }
}