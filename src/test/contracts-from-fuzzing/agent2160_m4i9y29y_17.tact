struct Level3 {
 a: Int;
 b: Bool?;
}

struct Level2 {
 l3: Level3;
 c: String?;
}

struct Level1 {
 l2: Level2;
 d: Int?;
}

contract OptionalDeep {
 data: Level1;

 init() {
  self.data = Level1{
    l2: Level2{
      l3: Level3{ a: 7, b: null },
      c: null
    },
    d: null
  };
 }
}