struct Level3 {
  a: Int;
}

struct Level2 {
  l3: Level3;
  flag: Bool;
}

struct Level1 {
  l2: Level2;
  s: String;
}

contract TestDeepNested {
  nested: Level1 = Level1{
    l2: Level2{
      l3: Level3{a: 42},
      flag: true
    },
    s: "ok"
  };
}