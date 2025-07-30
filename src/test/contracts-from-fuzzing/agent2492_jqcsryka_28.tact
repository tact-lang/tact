struct Wrap {
  a: Int;
  b: Bool;
}

contract InsideStruct {
  w: Wrap;

  init() {
    self.w = Wrap{a:5,b:true};
  }
}