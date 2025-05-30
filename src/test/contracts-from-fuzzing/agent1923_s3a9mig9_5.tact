struct Level3 { x: Int; y: Int?; }

struct Level2 { l3: Level3; flag: Bool; }

struct Level1 { l2: Level2; s: String; }

contract DeepChain {
  data: Level1;

  init() {
    self.data = Level1{
      l2: Level2{
        l3: Level3{ x: 1, y: null },
        flag: true
      },
      s: "z"
    };
  }
}