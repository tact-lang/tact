struct BoolNest {
  flag: Bool;
  inner: BoolInner;
}

struct BoolInner {
  nested: BoolDeep;
}

struct BoolDeep {
  deepFlag: Bool?;
}

contract BoolTest {
  val: BoolNest;

  init() {
    self.val = BoolNest{
      flag:true,
      inner: BoolInner{
        nested: BoolDeep{deepFlag:null}
      }
    };
  }
}