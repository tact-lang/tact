struct Level3 { n: Int; b: Bool; }
struct Level2 { lvl3: Level3; s: String; }
struct Level1 { lvl2: Level2; optInt: Int?; }

contract MultiNesting {
    item: Level1;

    init() {
        self.item = Level1{
            lvl2: Level2{ lvl3: Level3{ n:5, b:true }, s:"str" },
            optInt: null
        };
    }
}