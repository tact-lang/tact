struct Level3 { k: Int; }
struct Level2 { l3: Level3; s: String; }
struct Level1 { l2: Level2; flag: Bool; }

contract MultiNest {
    nested: Level1;

    init() {
        self.nested = Level1{
            l2: Level2{
                l3: Level3{ k: 99 },
                s: "test",
            },
            flag: true,
        };
    }
}
