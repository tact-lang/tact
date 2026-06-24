struct Level1 {
    a: Int;
    b: String;
}
struct Level2 {
    lvl1_a: Level1;
    lvl1_b: Level1;
}
struct Level3 {
    lvl2_a: Level2;
    lvl2_b: Level2;
}

contract WideDeepNested {
    tree: Level3;

    init() {
        self.tree = Level3{
            lvl2_a: Level2{
                lvl1_a: Level1{ a:1, b:"a" },
                lvl1_b: Level1{ a:2, b:"b" }
            },
            lvl2_b: Level2{
                lvl1_a: Level1{ a:3, b:"c" },
                lvl1_b: Level1{ a:4, b:"d" }
            }
        };
    }
}