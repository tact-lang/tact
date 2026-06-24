// deep optional -> struct w/ optional -> struct w/ optional primitive
struct Level3 {
    flag: Bool?;
}

struct Level2 {
    level3: Level3?;
}

struct Level1 {
    level2: Level2?;
}

contract TestContract {
    data: Level1?;

    init() {
        self.data = null;
    }
}