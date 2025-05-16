struct BoolTest {
  flag1: Bool;
  flag2: Bool;
  flag3: Bool;
  flag4: Bool;
}

contract BoolStore {
  bs: BoolTest;

  init() {
    self.bs = BoolTest{ flag1:true, flag2:false, flag3:true, flag4:false };
  }
}