struct Lvl3 {
  deep: Bool;
}

struct Lvl2 {
  inner: Lvl3;
}

struct Lvl1 {
  inner: Lvl2;
}

contract DeepBoolNest {
  val: Lvl1;

  init() {
    self.val = Lvl1{
      inner: Lvl2{
        inner: Lvl3{
          deep: true
        }
      }
    };
  }
}
