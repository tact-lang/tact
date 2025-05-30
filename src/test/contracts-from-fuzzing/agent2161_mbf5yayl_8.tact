// deep optional chain legality test (not nested optional, allowed)
struct Level1 {
    l2: Level2?;
}

struct Level2 {
    l3: Level3?;
}

struct Level3 {
    x: Int;
}

contract DeepOptionalChain {
    data: Level1;

    init() {
        self.data = Level1{ l2: null };
    }
}