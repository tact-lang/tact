struct Level3 { val: Int = 3; }

struct Level2 { next: Level3? = null; }

struct Level1 { next: Level2? = null; }

contract TestContract {
    chain: Level1? = null;

    init() {
        // remains null (deep optional nulls)
    }
}