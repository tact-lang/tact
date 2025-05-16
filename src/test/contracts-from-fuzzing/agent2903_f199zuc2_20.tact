struct VeryNested {
  l1: Level1;
}
struct Level1 {
  l2: Level2;
}
struct Level2 {
  l3: Level3;
}
struct Level3 {
  l4: Level4;
}
struct Level4 {
  x: Int;
}

contract Deep {
  s: VeryNested = VeryNested{ l1: Level1{ l2: Level2{ l3: Level3{ l4: Level4{ x: 42 } } } } };
}