struct Simple {
  x: Int;
  y: Bool;
  note: String;
}

contract Defaults {
  param: Simple = Simple { x:12, y:true, note:"hi" };

  init() {
    self.param = Simple{ x:99, y:false, note:"changed" };
  }
}
