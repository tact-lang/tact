struct Level3 { x: Int; }
struct Level2 { l3: Level3; y: Int; }
struct Level1 { l2: Level2; z: String; }

contract DeepNested {
    d: Level1;

    init() {
        self.d = Level1{
            l2: Level2{
                l3: Level3{ x: 7 },
                y: 3,
            },
            z: "deep",
        };
    }
}