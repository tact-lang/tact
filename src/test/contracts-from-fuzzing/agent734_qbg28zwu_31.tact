struct L3 {
  x: Int = 0;
  y: String?;
}

struct L2 {
  l3: L3;
  z: Bool?;
}

struct L1 {
  l2: L2;
  txt: String = "hi";
}

contract TestContract {
  deep: L1;

  init() {
    self.deep = L1{
      l2: L2{
        l3: L3{ y:null },
        z: null
      }
    };
  }
}