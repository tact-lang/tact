struct NestedLevel3 {
  flag: Bool;
}

struct NestedLevel2 {
  nl3: NestedLevel3;
}

struct NestedLevel1 {
  nl2: NestedLevel2;
}

contract DeepNested {
  deep: NestedLevel1;

  init() {
    self.deep = NestedLevel1{
      nl2: NestedLevel2{
        nl3: NestedLevel3{
          flag: true
        }
      }
    };
  }
}