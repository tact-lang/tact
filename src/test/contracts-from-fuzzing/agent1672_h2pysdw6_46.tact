struct SVal {
  s:Int;
  b:Bool;
}

contract WithBoth {
  fixed:SVal;
  opt:SVal?;

  init() {
    self.fixed = SVal{s:1,b:true};
    self.opt = null;
  }
}
