struct BoolWrap {
  f1: Bool;
  f2: Bool;
  f3: Bool;
}

contract MultiBool {
  state: BoolWrap;

  init() {
    self.state = BoolWrap{f1:true,f2:false,f3:true};
  }
}