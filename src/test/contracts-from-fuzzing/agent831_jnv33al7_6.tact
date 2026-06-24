struct Level3 { i: Int; }

struct Level2 { s: String; lvl3: Level3; }

struct Level1 { flag: Bool; lvl2: Level2; }

contract DeepLayers {
    val: Level1;
    init() {
        self.val = Level1{
            flag: false,
            lvl2: Level2{
                s: "ok",
                lvl3: Level3{ i: 99 }
            }
        };
    }
}