struct Level1 { x: Int; y: Int; }
struct Level2 { l1: Level1; flag: Bool; }
struct Level3 { l2: Level2; txt: String; }
contract TripleNest {
    deep: Level3;

    init() {
        self.deep = Level3{
            l2: Level2{ l1: Level1{ x:1, y:2 }, flag:true },
            txt: "deep"
        };
    }
}