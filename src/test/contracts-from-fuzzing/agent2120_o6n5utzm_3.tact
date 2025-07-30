struct Level3 { v: Int; }
struct Level2 { l3: Level3; opt: String?; }
struct Level1 { l2: Level2; flag: Bool; }

contract VeryDeepNested {
    deepField: Level1;
    init() {
        self.deepField = Level1{ l2: Level2{ l3: Level3{ v: 1 }, opt: null }, flag: true };
    }
}