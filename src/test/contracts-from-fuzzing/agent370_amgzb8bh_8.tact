struct Level3 {
  deepInt: Int;
}
struct Level2 {
  l3: Level3;
  deepStr: String;
}
struct Level1 {
  l2: Level2;
  flag: Bool;
}

contract DeepChain {
  chain: Level1;
  init() {
    self.chain = Level1{
      l2: Level2{
        l3: Level3{ deepInt: 123 },
        deepStr: "nested"
      },
      flag: true
    };
  }
}