struct Level3 {
    z: Int = 33;
}

struct Level2 {
    y: Level3?;
}

struct Level1 {
    x: Level2 = Level2{ y: null };
}

contract TestContract {
    nestedOptDefaults: Level1;

    init() {
        self.nestedOptDefaults = Level1{};
    }
}