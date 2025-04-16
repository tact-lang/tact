// Deeply nested, multi-level optional placements
struct Level3 {
    foo: Int?;
}

struct Level2 {
    lvl3: Level3?;
}

struct Level1 {
    lvl2: Level2?;
}

contract TestContract {
    nestedDeep: Level1?;

    init() {
        self.nestedDeep = null;
    }
}