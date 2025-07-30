struct Level3 {
  val: Int;
}

struct Level2 {
  nested3: Level3;
  flag: Bool;
}

struct Level1 {
  nested2: Level2;
  text: String;
}

contract NestedContract {
  data: Level1 = Level1{
    nested2: Level2{
      nested3: Level3{ val: 1 },
      flag: true
    },
    text: "hi"
  };
}
