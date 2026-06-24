// Massive nesting + optional chain
struct Bottom {
    x: Int?;
    y: String?;
}

struct Mid {
    bot: Bottom?;
}

struct Top {
    mid: Mid?;
}

contract OptNest {
    store: Top?;

    init() {
        self.store = Top{
            mid: Mid{
                bot: Bottom{
                    x: null,
                    y: "deep value"
                }
            }
        };
    }
}