struct Level3 {
  n: Int?;
  s: String;
}

struct Level2 {
  l3a: Level3;
  l3b: Level3;
}

struct Level1 {
  l2: Level2;
}

contract DeepOptionals {
    nested: Level1;
    init() {
        self.nested = Level1{
          l2: Level2{
            l3a: Level3{n: null, s: "x"},
            l3b: Level3{n: 5, s: "y"}
          }
        };
    }
}