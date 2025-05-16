struct OptNestedStructLevel2 {
  b: Int?;
}

struct OptNestedStructLevel1 {
  a: OptNestedStructLevel2?;
}

contract OptNestedInField {
  field: OptNestedStructLevel1;

  init() {
    self.field = OptNestedStructLevel1{
      a: OptNestedStructLevel2{
        b: 100
      }
    };
  }
}
