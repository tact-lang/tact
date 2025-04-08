struct L5 {
  val: Int;
}

struct L4 {
  nest: L5;
}

struct L3 {
  nest: L4;
}

struct L2 {
  nest: L3;
}

struct L1 {
  nest: L2;
}

contract DeepContract {
  deep: L1;

  init() {
    self.deep = L1{
      nest: L2{
        nest: L3{
          nest: L4{
            nest: L5{
              val: 42
            }
          }
        }
      }
    };
  }
}
