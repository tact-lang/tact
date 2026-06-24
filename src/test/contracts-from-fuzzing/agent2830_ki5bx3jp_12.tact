struct Level3 {
  deepVal: Int?;
}

struct Level2 {
  inner: Level3;
  flag: Bool;
}

struct Level1 {
  nested: Level2;
  name: String;
}

contract NestedLayered {
  storage: Level1;

  init() {
    self.storage = Level1{
      nested: Level2{ inner: Level3{ deepVal:null }, flag:true },
      name: "abc"
    };
  }
}