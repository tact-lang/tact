struct L3 {
  m: Int?;
  txt: String = "deep";
}

struct L2 {
  nested: L3?;
}

struct L1 {
  wrap: L2;
}

contract OptDeep {
  field: L1;

  init() {
    self.field = L1{
      wrap: L2{
        nested: L3{
          m: null
        }
      }
    };
  }
}
