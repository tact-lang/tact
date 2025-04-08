struct Level1 { f1: Int?; }
struct Level2 { l1: Level1?; }
struct Level3 { l2: Level2?; }

contract OptChain {
    store: Level3;

    init() {
        self.store = Level3{ l2: null };
    }
}