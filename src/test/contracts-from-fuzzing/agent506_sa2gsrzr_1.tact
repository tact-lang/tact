struct NestedLevel3 {
  deepVal: Int;
}

struct NestedLevel2 {
  inner: NestedLevel3;
}

struct NestedLevel1 {
  mid: NestedLevel2;
}

contract DeepNestedStorage {
  data: NestedLevel1;

  init() {
    self.data = NestedLevel1{
      mid: NestedLevel2{
        inner: NestedLevel3{
          deepVal: 123
        }
      }
    };
  }
}