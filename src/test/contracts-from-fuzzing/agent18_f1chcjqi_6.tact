struct Level3 { val3: Int }
struct Level2 { l3: Level3 }
struct Level1 { l2: Level2 }

contract DeepLevels {
    content: Level1;
    init() {
        self.content = Level1{ l2: Level2{ l3: Level3{ val3: 42 }}};
    }
}