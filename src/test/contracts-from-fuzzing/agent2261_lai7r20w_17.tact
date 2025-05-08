struct LDeep {
  val: Int?;
}
struct L3 {
  ldeep: LDeep;
}
struct L2 {
  l3: L3;
}
struct L1 {
  l2: L2;
}

contract DeepInnerOptional {
  data: L1;

  init() {
    self.data = L1 {
      l2: L2 {
        l3: L3 {
          ldeep: LDeep {
            val: null
          }
        }
      }
    };
  }
}