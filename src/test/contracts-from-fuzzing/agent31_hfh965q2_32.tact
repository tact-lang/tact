struct MultiBool {
  f1: Bool;
  f2: Bool;
  f3: Bool;
  f4: Bool;
  f5: Bool;
  f6: Bool;
}

contract Test {
  val: MultiBool;

  init() {
    self.val = MultiBool{
      f1:true,f2:false,f3:true,f4:false,f5:true,f6:false
    };
  }
}