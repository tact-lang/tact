struct Level3 { val: String; opt: Int?; }

struct Level2 { l3: Level3; str: String; }

struct Level1 { l2: Level2; flag: Bool; }

contract DeepNested {
  root: Level1;

  init() {
    self.root = Level1{
      l2: Level2{
        l3: Level3{
          val: "deep",
          opt: 42
        },
        str: "middle"
      },
      flag: true
    };
  }
}