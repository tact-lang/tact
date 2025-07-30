struct L4 {
  val: Int = 4;
}

struct L3 {
  child: L4 = L4{};
}

struct L2 {
  child: L3 = L3{};
}

struct L1 {
  child: L2 = L2{};
}

contract TestContract {
  root: L1;

  init() {
    self.root = L1{
      child: L2{
        child: L3{
          child: L4{ val: 123 }
        }
      }
    };
  }
}