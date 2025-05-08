struct NestedStructLevel2 {
  b: Int;
}

struct NestedStructLevel1 {
  a: NestedStructLevel2;
}

contract NestedInField {
  field: NestedStructLevel1;

  init() {
    self.field = NestedStructLevel1{
      a: NestedStructLevel2{ b: 42 }
    };
  }
}
