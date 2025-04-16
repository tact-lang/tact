struct Level3d { x: Int = 7; }

struct Level2d { l3: Level3d = Level3d{}; }

struct Level1d { l2: Level2d = Level2d{}; }

contract DeepDefaultsAll {
    f: Level1d;

    init() {
        self.f = Level1d{};
    }
}