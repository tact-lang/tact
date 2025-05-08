struct OptNestLevel1 { v: Int? }
struct OptNestLevel2 { inner: OptNestLevel1? }
struct OptNestLevel3 { inner: OptNestLevel2? }

contract NestedOptionals {
  data: OptNestLevel3;
  init() {
    self.data = OptNestLevel3{inner:null};
  }
}