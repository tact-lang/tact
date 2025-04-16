struct Level3 { a: Int; b: Bool }
struct Level2 { c: Level3; d: Int }
struct Level1 { e: Level2; f: String }

contract RecursionSim {
    data: Level1;

    init() {
      self.data = Level1{
        e: Level2{ c: Level3{ a: 5, b:true }, d:9 },
        f: "done"
      };
    }
}