struct Level3 {
  value: Int;
}

struct Level2 {
  sub: Level3;
}

struct Level1 {
  sub: Level2;
}

contract DeeplyNestedThreeLevels {
  top: Level1 = Level1{sub: Level2{sub: Level3{value: 123}}};
}