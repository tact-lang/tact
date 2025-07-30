struct NestedDeep {
  lvl2: NestedL2;
}

struct NestedL2 {
  lvl3: NestedL3;
}

struct NestedL3 {
  lvl4: NestedL4;
}

struct NestedL4 {
  val: Int;
}

contract NestedDeepFields {
  data: NestedDeep;

  init() {
    self.data = NestedDeep{
      lvl2: NestedL2{
        lvl3: NestedL3{
          lvl4: NestedL4{
            val:123
          }
        }
      }
    };
  }
}
