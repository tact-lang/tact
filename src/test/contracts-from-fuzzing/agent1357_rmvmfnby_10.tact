struct L3 {
  val: Int;
}

struct L2 {
  inner: L3;
}

struct L1 {
  inner: L2;
}

contract DeepNest {
  deep: L1;

  init() {
    self.deep = L1{
      inner: L2{
        inner: L3{
          val: 42
        }
      }
    };
  }
}