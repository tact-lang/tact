struct NestedLevel3 {
  z: Int;
}

struct NestedLevel2 {
  y: NestedLevel3;
}

struct NestedLevel1 {
  x: NestedLevel2;
}

contract VeryDeep {
  deep: NestedLevel1;

  init() {
    self.deep = NestedLevel1{
      x: NestedLevel2{
        y: NestedLevel3{
          z: 123
        }
      }
    };
  }
}