struct Level3 { z: Int; }
struct Level2 { l3: Level3; y: Bool; }
struct Level1 { l2: Level2; x: String; }

contract DeeplyNested {
    st: Level1;

    init() {
        self.st = Level1{
            l2: Level2{ l3: Level3{ z: 42 }, y: true },
            x: "deep"
        };
    }
}