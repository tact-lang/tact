struct Level1 {
  lv1Val: Int;
}

struct Level2 {
  inner: Level1;
}

struct Level3 {
  inner: Level2;
}

struct Level4 {
  inner: Level3;
}

struct Level5 {
  inner: Level4;
}

contract DeeplyNested5 {
  data: Level5 = Level5{
    inner: Level4{inner: Level3{inner: Level2{inner: Level1{lv1Val: 42}}}}
  };
}