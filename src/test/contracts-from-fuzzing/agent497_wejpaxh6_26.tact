struct Combo {
  intVal: Int;
  boolVal: Bool;
  strVal: String;
  optInt: Int?;
  optBool: Bool?;
  optStr: String?;
}

contract TestContract {
  combo: Combo;

  init() {
    self.combo = Combo{
      intVal:1,boolVal:true,strVal:"x",
      optInt:2,optBool:false,optStr:"y"
    };
  }
}