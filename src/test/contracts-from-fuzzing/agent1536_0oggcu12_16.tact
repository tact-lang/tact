// Contract with nested struct with multiple optional fields
struct Level2 {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct Level1 {
    lvl: Level2;
}

contract OptDeepContract {
    nest: Level1;

    init() {
        self.nest = Level1{ lvl: Level2{ x: null, y: true, z: null } };
    }
}