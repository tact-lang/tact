struct NestedRef1 {
  intVal: Int;
  next: NestedRef2;
}

struct NestedRef2 {
  boolVal: Bool;
  next: NestedRef3;
}

struct NestedRef3 {
  strVal: String;
}

contract NestedRefTest {
  field: NestedRef1;
  
  init() {
    self.field = NestedRef1{
      intVal: 1,
      next: NestedRef2{
        boolVal: true,
        next: NestedRef3{
          strVal: "deepValue"
        }
      }
    };
  }
}