struct NestedLevel3 {
  x: Int;
}

struct NestedLevel2 {
  l3: NestedLevel3;
}

struct NestedLevel1 {
  l2: NestedLevel2;
}

contract LongNest {
  nested: NestedLevel1;

  init() {
    self.nested = NestedLevel1{
      l2: NestedLevel2{
        l3: NestedLevel3{
          x: 11
        }
      }
    };
  }
}
