struct DeeplyNested {
  level1: Int;
  level2: Bool;
  level3: String;
  level4: Cell;
  level5: Slice;
}

contract TestContract {
  data1: DeeplyNested;
  data2: DeeplyNested;

  init() {
    self.data1 = DeeplyNested{level1:1, level2:true, level3:"a", level4:emptyCell(), level5:emptyCell().asSlice()};
    self.data2 = DeeplyNested{level1:2, level2:false, level3:"b", level4:emptyCell(), level5:emptyCell().asSlice()};
  }
}
