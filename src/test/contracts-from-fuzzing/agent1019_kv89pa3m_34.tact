struct Strange {
  intVal: Int;
  optVal: Int?;
  strVal: String;
  boolVal: Bool;
  optStr: String?;
}

contract SwapDefault {
  x: Strange;
  y: Strange;

  init() {
    self.x = Strange{ intVal:1, optVal:null, strVal:"x", boolVal:true, optStr:null };
    self.y = Strange{ intVal:2, optVal:null, strVal:"y", boolVal:false, optStr:null };
  }
}
